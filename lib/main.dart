import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yum_quick/Features/login/data/models/user_model/user_model.dart';
import 'package:yum_quick/const.dart';
import 'package:yum_quick/core/language/language_cubit.dart';
import 'package:yum_quick/generated/l10n.dart';
import 'package:yum_quick/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());

  await Hive.openBox<UserModel>(kUserModelBox);
  await Hive.openBox<int>(isRegisteredBox);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LanguageCubit()),
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
          title: 'TaskMate',
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
