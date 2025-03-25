import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_quick/core/language/language_cubit.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).go('/mainScreen');
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              const SizedBox(width: 15),
              const Text(
                "Settings",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),

        // ✅ **إعدادات التطبيق**
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: BlocBuilder<LanguageCubit, LanguageCubitState>(
              builder: (context, state) {
                String currentLanguage = 'ar'; // الافتراضي
                if (state is LanguageChange) {
                  currentLanguage = state.selectedLanguage;
                }
                bool isArabic = currentLanguage == 'ar';

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),

                      // 🔄 **تغيير اللغة**
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Language",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Switch(
                              value: isArabic,
                              onChanged: (bool newValue) {
                                context
                                    .read<LanguageCubit>()
                                    .changeLanguage(newValue ? 'ar' : 'en');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
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
