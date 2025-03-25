import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yum_quick/Features/home/data/models/recommended_category/recommended_category.dart';
import 'package:yum_quick/Features/home/data/repositories/recommended_category/repo.dart';

part 'recommended_category_state.dart';

class RecommendedCategoryCubit extends Cubit<RecommendedCategoryState> {
  final RecommendedCategoryRepo recommendedCategoryRepo;
  RecommendedCategoryCubit(this.recommendedCategoryRepo) : super(RecommendedCategoryInitial());

  Future<void> getRecommendedCategory() async {
    emit(RecommendedCategoryLoadingState());
    final result = await recommendedCategoryRepo.getRecommendedCategory();
    result.fold(
      (failure) => emit(RecommendedCategoryFailureState(errMessage: failure.errorMessage)),
      (recommendedCategory) => emit(RecommendedCategorySuccessState([recommendedCategory])),
    );
}
}