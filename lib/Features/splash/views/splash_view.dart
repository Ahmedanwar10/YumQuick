import 'package:flutter/material.dart';
import 'package:yum_quick/Features/splash/views/widgets/splash_view_body.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager. colorHeader,
      body: SplashViewBody(),
    );
  }
}