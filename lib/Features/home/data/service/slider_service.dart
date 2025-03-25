import 'package:dio/dio.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';

class SliderService {
  final DioWrapper _dioWrapper = DioWrapper();

  SliderService(
    DioWrapper dioWrapper,
  );

  Future<Response?> getSlider() async {
    Response? response = await _dioWrapper.getRequest('/sliders');

    if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: Slider');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
    } else {
      print('❌ Slider Failed: No Response from Server');
    }

    return response;
  }
}
