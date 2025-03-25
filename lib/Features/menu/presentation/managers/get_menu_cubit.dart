import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yum_quick/Features/home/data/models/best_seller/category.dart';
import 'package:yum_quick/Features/menu/data/model/get_menu/get_menu.dart';
import 'package:yum_quick/Features/menu/data/repo_get_data/repo_get_products.dart';

part 'get_menu_state.dart';

class GetMenuCubit extends Cubit<GetMenuState> {
  final RepoGetProducts repoGetProducts;

  GetMenuCubit(this.repoGetProducts) : super(GetMenuInitial());

  Future<void> getProducts() async {
    emit(GetMenuLoading());

    final failureOrProducts = await repoGetProducts.getProducts();
    
    failureOrProducts.fold(
      (failure) => emit(GetMenuFailure(errorMessage: failure.errorMessage)),
      (products) => emit(GetMenuSuccess(products)), // ✅ تمرير المنتجات مباشرةً
    );
  }
}
