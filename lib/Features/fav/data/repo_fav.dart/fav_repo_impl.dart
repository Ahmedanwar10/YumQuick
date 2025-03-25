import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:yum_quick/Features/fav/data/repo_fav.dart/fav_repo.dart';
import 'package:yum_quick/Features/fav/data/service_fav/fav_service.dart';
import 'package:yum_quick/Features/home/data/models/recommended_category/recommended_category.dart';
import 'package:yum_quick/Features/menu/data/model/get_menu/category.dart';
import 'package:yum_quick/Features/menu/data/model/get_menu/product.dart';
import 'package:yum_quick/core/failure/failure.dart';

class FavRepoImpl implements FavRepo {
  final FavService favService;

  FavRepoImpl({required this.favService});

  @override
  Future<Either<Failure, Product>> getFav(int id) async {
    try {
      final response = await favService.getFetchFav(id);

      if (response != null && response.data != null) {
        // ✅ تأكد أن البيانات `Product`
        return Right(Product.fromJson(response.data));
      } else {
        return Left(ServerFailure("No data received from the server"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
