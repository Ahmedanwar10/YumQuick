import 'package:flutter/material.dart';
import 'package:yum_quick/Features/menu/presentation/views/widgets/menue_view_body.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.colorHeader,
      body: MenuViewBody(),
    );
  }
}
