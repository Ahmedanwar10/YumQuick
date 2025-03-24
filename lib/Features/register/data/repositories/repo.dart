import 'package:either_dart/either.dart';
import 'package:yum_quick/core/failure/failure.dart';

abstract class RepoRegister {
  Future<Either<Failure, dynamic>> register({
    required String email,
     required String password,
     required String name,
     required String phone,
     });
}