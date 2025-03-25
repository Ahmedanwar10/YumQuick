import 'package:dio/dio.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';

class RegisterService {
  final DioWrapper _dioWrapper = DioWrapper();

  RegisterService(DioWrapper dioWrapper);
  Future<Response?> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
    };
    print("🔍 Attempting register with: $body");
    Response? response = await _dioWrapper.postRequest(
      '/register',
      data: body,
    );
    if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: register');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
    } else {
      print('❌ Register Failed: No Response from Server');
    }
    return response;
  }
}
