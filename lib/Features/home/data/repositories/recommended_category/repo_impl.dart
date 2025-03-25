import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:yum_quick/Features/home/data/models/recommended_category/recommended_category.dart';
import 'package:yum_quick/Features/home/data/repositories/recommended_category/repo.dart';
import 'package:yum_quick/Features/home/data/service/recommended_category_service.dart';
import 'package:yum_quick/core/failure/failure.dart';

class RecommendedCategoryRepoImpl implements RecommendedCategoryRepo {
  final RecommendedCategoryService recommendedCategoryService;

  RecommendedCategoryRepoImpl({required this.recommendedCategoryService});
  @override
  Future<Either<Failure, RecommendedCategory>> getRecommendedCategory() async {
    try {
      final response =
          await recommendedCategoryService.getRecommendedCategories();
      if (response != null && response.data != null) {
        return Right(RecommendedCategory.fromJson(
            response.data)); // ✅ إرجاع RecommendedCategory بالكامل
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
