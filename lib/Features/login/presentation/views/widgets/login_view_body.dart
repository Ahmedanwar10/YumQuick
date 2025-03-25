import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yum_quick/Features/login/presentation/managers/login_cubit.dart';
import 'package:yum_quick/core/common/functions/show_awesome_dialoge.dart';
import 'package:yum_quick/core/common/widgets/custtom_botton.dart';
import 'package:yum_quick/core/common/widgets/text_form_field.dart';
import 'package:yum_quick/core/resources/app_style.dart';
import 'package:yum_quick/core/resources/color_managers.dart';
import 'package:yum_quick/generated/l10n.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorManager.primary,
              ),
            ),
            const Spacer(),
            const Text(
              "Hello",
              style: TextStyle(
                color: ColorManager.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 50),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            decoration: const BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  setState(() => isLoading = false);
                  showAwesomeDialouge(
                    context,
                    message: S.of(context).login_successfully,
                    title: S.of(context).login_success_title,
                    buttonColor: ColorManager.primary,
                    dialogType: DialogType.success,
                    onOkPressed: () {
                      GoRouter.of(context).go('/mainScreen');
                    },
                  );
                } else if (state is LoginFailure) {
                  setState(() => isLoading = false);
                  showAwesomeDialouge(
                    context,
                    message: state.errorMessage,
                    buttonColor: Colors.red,
                  );
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: isLoading,
                  progressIndicator: const CircularProgressIndicator(),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome',
                            style: TextStyle(
                              color: ColorManager.dark,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Email Field
                          const Text(
                            "Email",
                            style: TextStyle(
                              color: ColorManager.dark,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          CustomTextFormField(
                            hint: "Enter email here",
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Email can't be empty";
                              }
                              // التحقق من صحة البريد الإلكتروني
                              final emailRegEx = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                              if (!emailRegEx.hasMatch(value)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          // Password Field
                          const Text(
                            "Password",
                            style: TextStyle(
                              color: ColorManager.dark,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          CustomTextFormField(
                            hint: "************",
                            controller: passwordController,
                            isSecure: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Password can't be empty";
                              }
                              if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 40),

                          // Login Button
                          Center(
                            child: CustomButtonText(
                              text: 'Log In',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  debugPrint("✅ Login Successful");
                                  context.read<LoginCubit>().login(
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                      );
                                }
                              },
                              width: 250,
                              height: 50,
                              color: ColorManager.primary,
                            ),
                          ),
                          const SizedBox(height: 8),

                          /// 🔵 رابط التسجيل في حالة عدم وجود حساب
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).go('/register');
                            },
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: S.of(context).dont_have_account,
                                      style: AppStyles.styleSomarSansBold12(
                                          context),
                                    ),
                                    TextSpan(
                                      text: S.of(context).register,
                                      style: AppStyles.styleSomarSansBold12(
                                              context)
                                          .copyWith(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
