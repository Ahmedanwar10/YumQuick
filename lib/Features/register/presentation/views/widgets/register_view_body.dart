import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yum_quick/Features/register/presentation/managers/register_cubit.dart';
import 'package:yum_quick/core/common/functions/show_awesome_dialoge.dart';
import 'package:yum_quick/core/common/widgets/custtom_botton.dart';
import 'package:yum_quick/core/common/widgets/text_form_field.dart';
import 'package:yum_quick/core/resources/color_managers.dart';
import 'package:yum_quick/core/resources/app_style.dart';
import 'package:yum_quick/generated/l10n.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        Row(
          children: [
            IconButton(
              onPressed: () => GoRouter.of(context).go('/login'),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorManager.primary,
              ),
            ),
            const Spacer(),
            Text(
              S.of(context).new_account,
              style: const TextStyle(
                color: ColorManager.dark,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 30),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            decoration: const BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterFailure) {
                  setState(() => isLoading = false);
                  showAwesomeDialouge(
                    context,
                    message: state.errorMessage,
                    buttonColor: Colors.red,
                  );
                }
                if (state is RegisterSuccess) {
                  showAwesomeDialouge(
                    context,
                    message: S.of(context).register_successfully,
                    title: S.of(context).register_success_title,
                    buttonColor: ColorManager.primary,
                    dialogType: DialogType.success,
                    onOkPressed: () {
                      GoRouter.of(context)
                          .go('/login'); // ✅ الانتقال يتم بعد الضغط على OK
                    },
                  );
                } else if (state is RegisterLoading) {
                  setState(() => isLoading = true);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: isLoading,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Full name"),
                          const SizedBox(height: 5),
                          CustomTextFormField(
                            hint: "Enter full name here",
                            controller: fullNameController,
                          ),
                          const SizedBox(height: 15),
                          const Text("Email"),
                          const SizedBox(height: 5),
                          CustomTextFormField(
                            hint: "example@example.com",
                            controller: emailController,
                          ),
                          const SizedBox(height: 15),
                          const Text("Mobile Number"),
                          const SizedBox(height: 5),
                          CustomTextFormField(
                            hint: "+ 123 456 789",
                            controller: mobileController,
                          ),
                          const SizedBox(height: 15),
                          const Text("Password"),
                          const SizedBox(height: 5),
                          CustomTextFormField(
                            hint: "************",
                            controller: passwordController,
                            isSecure: true,
                          ),
                          const SizedBox(height: 15),
                          const Text("Confirm Password"),
                          const SizedBox(height: 5),
                          CustomTextFormField(
                            hint: "************",
                            controller: confirmPasswordController,
                            isSecure: true,
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: CustomButtonText(
                              text: "Sign Up",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  debugPrint("✅ Registration Successful");
                                  context.read<RegisterCubit>().register(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: fullNameController.text,
                                      phone: mobileController.text);
                                }
                              },
                              width: 250,
                              height: 50,
                              color: ColorManager.primary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "By continuing, you agree to ",
                                    style:
                                        AppStyles.styleSomarSansBold12(context),
                                  ),
                                  TextSpan(
                                    text: "Terms of Use and Privacy Policy.",
                                    style:
                                        AppStyles.styleSomarSansBold12(context)
                                            .copyWith(color: Colors.blue),
                                  ),
                                ],
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
