import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:yum_quick/Features/home/data/models/silder/silder_model.dart';
import 'package:yum_quick/Features/home/data/repositories/repo_slider/repo.dart';
import 'package:yum_quick/Features/home/data/service/slider_service.dart';
import 'package:yum_quick/core/failure/failure.dart';

class RepoSliderImpl implements SliderRepo {
  final SliderService sliderService;

  RepoSliderImpl({required this.sliderService});

  @override
  Future<Either<Failure, SilderModel>> getSliderData() async {
    try {
      var response = await sliderService.getSlider();
      return Right(SilderModel.fromJson(response!.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
