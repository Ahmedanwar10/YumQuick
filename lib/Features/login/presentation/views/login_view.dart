import 'package:flutter/material.dart';
import 'package:yum_quick/Features/login/presentation/views/widgets/login_view_body.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.colorHeader,
      body: LoginViewBody(),
    );
  }
}
