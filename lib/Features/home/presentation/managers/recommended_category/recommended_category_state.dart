part of 'recommended_category_cubit.dart';

@immutable
abstract class RecommendedCategoryState {}

class RecommendedCategoryInitial extends RecommendedCategoryState {}

class RecommendedCategorySuccessState extends RecommendedCategoryState {
  final List<RecommendedCategory> recommendedCategoryList;
  RecommendedCategorySuccessState(this.recommendedCategoryList);
}

class RecommendedCategoryFailureState extends RecommendedCategoryState {
  final String errMessage;

  RecommendedCategoryFailureState({required this.errMessage});
}

  class RecommendedCategoryLoadingState extends RecommendedCategoryState {}
