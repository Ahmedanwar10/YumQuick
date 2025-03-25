
import 'package:either_dart/either.dart';
import 'package:yum_quick/Features/menu/data/model/get_menu/get_menu.dart';
import 'package:yum_quick/core/failure/failure.dart';

abstract class RepoGetProducts {
  Future<Either<Failure, List<GetMenu>>> getProducts();
  
}