import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yum_quick/Features/login/data/repositories/login_repo_impl.dart';
import 'package:yum_quick/Features/login/data/service/api_login.dart';
import 'package:yum_quick/Features/login/presentation/managers/login_cubit.dart';
import 'package:yum_quick/Features/login/presentation/views/widgets/login_view_body.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorHeader,
      body: BlocProvider(
        create: (context) => LoginCubit(LoginRepoImpl(
          loginService: LoginService(DioWrapper()),
        )),
        child: LoginViewBody(),
      ),
    );
  }
}
