import 'package:dio/dio.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';

class BestSellerService {
   final DioWrapper _dioWrapper = DioWrapper();

  BestSellerService(
    DioWrapper dioWrapper,
  );
  Future<Response?> getBestSellers() async {
    Response? response = await _dioWrapper.
    getRequest('/best_seller_products');
   
    if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: BestSeller');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
    } else {
      print('❌ BestSeller Failed: No Response from Server');
    }

    return response;
  }
}
