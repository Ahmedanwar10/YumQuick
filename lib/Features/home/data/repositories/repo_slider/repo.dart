import 'package:either_dart/either.dart';
import 'package:yum_quick/Features/home/data/models/silder/silder_model.dart';
import 'package:yum_quick/core/failure/failure.dart';

abstract class SliderRepo {
  Future<Either<Failure, SilderModel>> getSliderData();
}
