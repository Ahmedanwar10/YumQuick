import 'package:flutter/material.dart';
import 'package:yum_quick/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.colorHeader,
      body:  HomeViewBody(),
    );
  }
}
