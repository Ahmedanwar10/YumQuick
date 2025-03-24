import 'package:dio/dio.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';

class LoginService {
  final DioWrapper _dioWrapper = DioWrapper();

  LoginService(DioWrapper dioWrapper); // Singleton

  Future<Response?> login(
      {required String email, required String password}) async {
    Map<String, dynamic> body = {
      'username': email,
      'password': password,
    };

    print("🔍 Attempting Login with: $body");

    Response? response = await _dioWrapper.postRequest(
      '/login',
      data: body,
    );

    if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: login');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
    } else {
      print('❌ Login Failed: No Response from Server');
    }

    return response;
  }
}