import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yum_quick/Features/home/data/repositories/recommended_category/repo_impl.dart';
import 'package:yum_quick/Features/home/data/repositories/repo_slider/repo_impl.dart';
import 'package:yum_quick/Features/home/data/service/recommended_category_service.dart';
import 'package:yum_quick/Features/home/data/service/slider_service.dart';
import 'package:yum_quick/Features/home/presentation/managers/recommended_category/recommended_category_cubit.dart';
import 'package:yum_quick/Features/home/presentation/managers/slider/slider_cubit.dart';
import 'package:yum_quick/Features/login/data/models/user_model/user_model.dart';
import 'package:yum_quick/Features/login/data/service/api_login.dart';
import 'package:yum_quick/const.dart';
import 'package:yum_quick/core/common/widgets/wrapper_dio.dart';
import 'package:yum_quick/core/language/language_cubit.dart';
import 'package:yum_quick/generated/l10n.dart';
import 'package:yum_quick/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());

  await Hive.openBox<UserModel>(kUserModelBox);
  await Hive.openBox<int>(isRegisteredBox);
  await Hive.openBox<String>('authBox');
  await DioWrapper().initialize(); // 🔥 تأكد من تحميل التوكن بعد فتح Hive

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LanguageCubit()),
      BlocProvider(
          create: (context) => SliderCubit(
                RepoSliderImpl(sliderService: SliderService(DioWrapper())),
              )..getSliderData()),
      BlocProvider(
          create: (context) => RecommendedCategoryCubit(
              RecommendedCategoryRepoImpl(
                  recommendedCategoryService:
                      RecommendedCategoryService(DioWrapper())))),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageCubitState>(
      builder: (context, langState) {
        String languageCode = "en"; // تغيير اللغة الافتراضية إلى الإنجليزية
        if (langState is LanguageChange) {
          languageCode = langState.selectedLanguage;
        }

        return MaterialApp.router(
          locale: Locale(languageCode),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.router,
        );
      },
    );
  }
}
