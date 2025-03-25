import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yum_quick/Features/home/data/models/best_seller/best_seller.dart';
import 'package:yum_quick/Features/home/data/repositories/repo.dart';

part 'bestsellerproduct_state.dart';

class BestsellerproductCubit extends Cubit<BestsellerproductState> {
  final BestSellerProductRepo bestSellerProductRepo;

  BestsellerproductCubit(this.bestSellerProductRepo) : super(BestsellerproductInitial());

  Future<void> getHomeData() async {
    emit(BestsellerproductLoading());
    var result = await bestSellerProductRepo.getHomeData();
    result.fold(
      (failure) => emit(BestsellerproductFailure(errMessage: failure.errorMessage)),
      (bestSeller) => emit(BestsellerproductSuccess(bestSeller)), // ✅ تمرير BestSeller بالكامل
    );
  }
}
