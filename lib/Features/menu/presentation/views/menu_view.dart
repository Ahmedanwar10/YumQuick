import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yum_quick/Features/menu/data/repo_get_data/repo_get_products_impl.dart';
import 'package:yum_quick/Features/menu/data/service_get_data/service_menu.dart';
import 'package:yum_quick/Features/menu/presentation/managers/get_menu_cubit.dart';
import 'package:yum_quick/Features/menu/presentation/views/widgets/menue_view_body.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMenuCubit(RepoGetProductsImpl(
        serviceMenu: ServiceMenu(DioWrapper())),
      )..getProducts(),
      child: const Scaffold(
        backgroundColor: ColorManager.colorHeader,
        body: MenuViewBody(),
      ),
    );
  }
}
