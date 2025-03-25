import 'package:dio/dio.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';

class RecommendedCategoryService {
final DioWrapper _dioWrapper = DioWrapper();

  RecommendedCategoryService(
    DioWrapper dioWrapper,);

  Future<Response?> getRecommendedCategories() async {
    Response? response = await _dioWrapper.getRequest('/categories');

    if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: RecommendedCategory');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
    } else {
      print('❌ RecommendedCategory Failed: No Response from Server');
    }

    return response;
  }

}