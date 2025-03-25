import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:yum_quick/Features/menu/data/model/get_menu/get_menu.dart';
import 'package:yum_quick/Features/menu/data/repo_get_data/repo_get_products.dart';
import 'package:yum_quick/Features/menu/data/service_get_data/service_menu.dart';
import 'package:yum_quick/core/failure/failure.dart';

/// Repository implementation for fetching product data from the menu service.
class RepoGetProductsImpl implements RepoGetProducts {
  /// Instance of [ServiceMenu] to fetch menu data.
  final ServiceMenu serviceMenu;

  /// Constructor requires a [ServiceMenu] instance.
  RepoGetProductsImpl({required this.serviceMenu});

  /// Fetches the list of products from the menu service.
  ///
  /// Returns an [Either] type:
  /// - Right: A list of [GetMenu] objects on success.
  /// - Left: A [Failure] object on failure.
  @override
  Future<Either<Failure, List<GetMenu>>> getProducts() async {
    try {
      final response = await serviceMenu.getMenu();

      if (response?.data == null) {
        return Left(ServerFailure('No data received'));
      }

      return Right(
        (response!.data as List)
            .map((item) => GetMenu.fromJson(item))
            .toList(),
      );
    } catch (e) {
      return Left(e is DioException
          ? ServerFailure.fromDioException(e)
          : ServerFailure(e.toString()));
    }
  }
}
