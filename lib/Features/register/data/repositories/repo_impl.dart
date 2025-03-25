import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:yum_quick/Features/register/data/repositories/repo.dart';
import 'package:yum_quick/Features/register/data/service/register_service.dart';
import 'package:yum_quick/core/failure/failure.dart';

class RepoImplRegister implements RepoRegister {
  final RegisterService registerService;

  RepoImplRegister({required this.registerService});

  @override
  Future<Either<Failure, dynamic>> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    try {
      var responseRegister = await registerService.register(
          email: email, password: password, name: name, phone: phone);
      if (responseRegister == null) {
        return Left(
            ServerFailure("خطأ غير متوقع، لم يتم استلام رد من السيرفر"));
      }
      return Right(responseRegister);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
