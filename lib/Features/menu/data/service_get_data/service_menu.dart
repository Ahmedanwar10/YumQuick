
import 'package:dio/dio.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';

class ServiceMenu {
  final DioWrapper _dioWrapper = DioWrapper();

  ServiceMenu(
    DioWrapper dioWrapper,);
  Future<Response?> getMenu() async {
    Response? response = await _dioWrapper.getRequest('/products');

    if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: ServiceMenu');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
    } else {
      print('❌ ServiceMenu Failed: No Response from Server');
    }

    return response;
  }
}