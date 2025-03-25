import 'package:either_dart/either.dart';
import 'package:yum_quick/Features/home/data/models/recommended_category/recommended_category.dart';
import 'package:yum_quick/core/failure/failure.dart';

abstract class RecommendedCategoryRepo {
  Future<Either<Failure, RecommendedCategory>> getRecommendedCategory();
}
