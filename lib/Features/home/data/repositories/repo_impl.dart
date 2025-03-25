import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:yum_quick/Features/home/data/models/best_seller/best_seller.dart';
import 'package:yum_quick/Features/home/data/repositories/repo.dart';
import 'package:yum_quick/Features/home/data/service/best_seller_service.dart';
import 'package:yum_quick/core/failure/failure.dart';

class RepoImpl implements BestSellerProductRepo {
  final BestSellerService bestSellerService;

  RepoImpl({required this.bestSellerService});

  @override
  Future<Either<Failure, BestSeller>> getHomeData() async {
    try {
      var response = await bestSellerService.getBestSellers();
      return Right(BestSeller.fromJson(response!.data)); // ✅ إرجاع BestSeller بالكامل
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
