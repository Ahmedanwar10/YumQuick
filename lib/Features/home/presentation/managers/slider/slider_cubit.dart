import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yum_quick/Features/home/data/models/silder/silder_model.dart';
import 'package:yum_quick/Features/home/data/repositories/repo_slider/repo.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  final SliderRepo sliderRepo;
  SliderCubit(this.sliderRepo) : super(SliderInitial());
  Future<void> getSliderData() async {
    emit(SliderLoadingState());
    final result = await sliderRepo.getSliderData();
    result.fold(
      (failure) => emit(SliderFailureState(errMessage: failure.errorMessage)),
      (slider) => emit(SliderSuccessState(slider)),
    );
  }
}
