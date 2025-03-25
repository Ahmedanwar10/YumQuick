import 'package:either_dart/either.dart';
import 'package:yum_quick/Features/menu/data/model/get_menu/product.dart';
import 'package:yum_quick/core/failure/failure.dart';

abstract class FavRepo {
  Future<Either<Failure, Product>> getFav(int id);
}
