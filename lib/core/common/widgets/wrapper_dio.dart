import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioWrapper {
  static final DioWrapper _instance = DioWrapper._internal();
  factory DioWrapper() => _instance;
  Dio get dio => _dio;

  late final Dio _dio;
  final int _timeOut = 120 * 1000;
  String? _authToken;
  bool _isRefreshing = false;
  final List<void Function(String)> _tokenQueue = [];

  DioWrapper._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://nti-ecommerce-api-production.up.railway.app/api/',
      connectTimeout: Duration(milliseconds: _timeOut),
      receiveTimeout: Duration(milliseconds: _timeOut),
      headers: {"Accept": "application/json"},
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  Future<void> initialize() async {
    var box = Hive.box<String>('authBox');
    String? token = box.get('token');
    String? refreshToken = box.get('refresh_token');

    print("🔑 Token from Hive: $token");
    print("🔄 Stored Refresh Token from Hive: $refreshToken");

    setToken(token);
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("🚀 Requesting: ${options.method} ${options.uri}");
    print("📤 Headers: ${options.headers}");
    print("📦 Data Sent: ${options.data}");
    handler.next(options);
  }

  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    print("✅ Response: ${response.statusCode}");
    print("📥 Response Data: ${response.data}");
    handler.next(response);
  }

  void _onError(DioException error, ErrorInterceptorHandler handler) async {
    print("❌ Dio Error: ${error.response?.statusCode}");
    print("⚠️ Error Message: ${error.message}");

    if (error.response?.statusCode == 401) {
      String? newToken = await handleTokenRefresh();
      if (newToken != null) {
        error.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        final retryResponse = await _dio.fetch(error.requestOptions);
        return handler.resolve(retryResponse);
      } else {
        _logoutUser();
      }
    }
    handler.next(error);
  }

  Future<String?> handleTokenRefresh() async {
    if (_isRefreshing) {
      return Completer<String?>().future;
    }

    _isRefreshing = true;
    var box = Hive.box<String>('authBox');
    String? refreshToken = box.get('refresh_token');

    if (refreshToken == null) {
      _logoutUser();
      return null;
    }

    try {
      final response = await _dio.post(
        'refresh_token',
        options: Options(headers: {"Authorization": "Bearer $refreshToken"}),
      );

      if (response.statusCode == 200) {
        String newAccessToken = response.data['accessToken'];
        await box.put('token', newAccessToken);
        setToken(newAccessToken);

        _tokenQueue.forEach((callback) => callback(newAccessToken));
        _tokenQueue.clear();
        return newAccessToken;
      }
      return null;
    } catch (e) {
      _logoutUser();
      return null;
    } finally {
      _isRefreshing = false;
    }
  }

  void setToken(String? token) {
    _authToken = token;
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    } else {
      _dio.options.headers.remove("Authorization");
    }
  }

  void clearToken() {
    _authToken = null;
    _dio.options.headers.remove("Authorization");
    var box = Hive.box<String>('authBox');
    box.delete('token');
    box.delete('refresh_token');
  }

  Future<Response?> postRequest(String endpoint,
      {Map<String, dynamic>? data, bool requiresAuth = false}) async {
    return _handleRequest(() => _dio.post(
          endpoint,
          data: data,
          options: Options(headers: _getHeaders(requiresAuth),
          contentType: Headers.formUrlEncodedContentType,
          ),
     ) );
  }

  Future<Response?> putRequest(String endpoint,
      {Map<String, dynamic>? data, bool requiresAuth = false}) async {
    return _handleRequest(() => _dio.put(
          endpoint,
          data: data,
          options: Options(headers: _getHeaders(requiresAuth)),
        ));
  }

  Future<Response?> getRequest(String endpoint,
      {bool requiresAuth = false}) async {
    return _handleRequest(() => _dio.get(
          endpoint,
          options: Options(headers: _getHeaders(requiresAuth)),
     ) );
  }

  Future<Response?> deleteRequest(String endpoint,
      {bool requiresAuth = false}) async {
    return _handleRequest(() => _dio.delete(
          endpoint,
          options: Options(headers: _getHeaders(requiresAuth)),
        ));
  }

  Future<Response?> _handleRequest(Future<Response> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      print("⚠️ Dio Error: ${e.message}");
      return e.response;
    }
  }

  Map<String, String> _getHeaders(bool requiresAuth) {
    return requiresAuth ? {"Authorization": "Bearer $_authToken"} : {};
  }

  void _logoutUser() async {
    clearToken();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // Add navigation to login screen here
  }
}