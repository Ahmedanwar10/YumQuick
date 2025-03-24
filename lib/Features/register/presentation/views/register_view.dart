import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yum_quick/Features/register/data/repositories/repo_impl.dart';
import 'package:yum_quick/Features/register/data/service/register_service.dart';
import 'package:yum_quick/Features/register/presentation/managers/register_cubit.dart';
import 'package:yum_quick/Features/register/presentation/views/widgets/register_view_body.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.colorHeader,
      body: BlocProvider(
        create: (context) => RegisterCubit(
          RepoImplRegister(registerService: RegisterService(DioWrapper())),
        ),
        child: RegisterViewBody(),
      ),
    );
  }
}
