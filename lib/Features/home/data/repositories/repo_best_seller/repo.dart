import 'package:either_dart/either.dart';
import 'package:yum_quick/Features/home/data/models/best_seller/best_seller.dart';
import 'package:yum_quick/core/failure/failure.dart';

abstract class BestSellerProductRepo {
  Future<Either<Failure, BestSeller>> getHomeData();
}
