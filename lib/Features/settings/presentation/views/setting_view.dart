import 'package:flutter/material.dart';
import 'package:yum_quick/Features/settings/presentation/views/widgets/setting_view_body.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.colorHeader,
      body:  SettingViewBody(),
    );
  }
}