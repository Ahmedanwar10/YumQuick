import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:yum_quick/Features/login/data/models/login_data_model/login_data_model.dart';
import 'package:yum_quick/Features/login/data/repositories/login_repo.dart';
import 'package:yum_quick/Features/login/data/service/api_login.dart';
import 'package:yum_quick/core/failure/failure.dart';

class LoginRepoImpl implements LoginRepo{
  final LoginService loginService;
  LoginRepoImpl({required this.loginService});
  @override
  Future<Either<Failure, LoginDataModel>> login({required String email, required String password})async {
    try {
      var data = await loginService.login(email: email, password: password);
      return Right(LoginDataModel.fromJson(data!.data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}