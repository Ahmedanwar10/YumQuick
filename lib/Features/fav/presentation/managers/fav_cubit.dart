import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yum_quick/Features/fav/data/repo_fav.dart/fav_repo.dart';
import 'package:yum_quick/Features/menu/data/model/get_menu/product.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  final FavRepo favRepo;
  FavCubit(this.favRepo) : super(FavInitial());
  Future<void> getFav(int id) async {
    emit(FavLoading());
    var result = await favRepo.getFav(id);
    result.fold(
      (failure) => emit(FavFailure(errorMessage: failure.errorMessage)),
      (product) => emit(FavSuccess([product])), // ✅ تمرير Product بالكامل
    );
  }
  
}
