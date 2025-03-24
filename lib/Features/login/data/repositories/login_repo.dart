import 'package:either_dart/either.dart';
import 'package:yum_quick/Features/login/data/models/login_data_model/login_data_model.dart';
import 'package:yum_quick/core/failure/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginDataModel>> login(
      {required String email, required String password});
}