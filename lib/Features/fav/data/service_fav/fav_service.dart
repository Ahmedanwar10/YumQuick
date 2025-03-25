import 'package:dio/dio.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';

class FavService {
  final DioWrapper _dioWrapper = DioWrapper();

  Future<Response?> getFetchFav(int id) async {
    Response? response = await _dioWrapper.postRequest(
      '/add_to_favorite',
      data: {'product_id': id},
    );

    if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: Fav');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
      return response; // ✅ لازم نرجع الريسبونس
    } else {
      print('❌ Fav Failed: No Response from Server');
      return null; // ✅ رجع null لو مفيش استجابة
    }
  }
}
