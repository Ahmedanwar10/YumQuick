import 'package:flutter/material.dart';
import 'package:yum_quick/Features/register/presentation/views/widgets/register_view_body.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.colorHeader,
      body:  RegisterViewBody(),
    );
  }
}
