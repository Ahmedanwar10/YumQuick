import 'package:go_router/go_router.dart';
import 'package:yum_quick/Features/login/presentation/views/login_view.dart';
import 'package:yum_quick/Features/onBoarding/views/widgets/onboarding_screen.dart';
import 'package:yum_quick/Features/register/presentation/views/register_view.dart';

import 'package:yum_quick/Features/splash/views/splash_view.dart';
import 'package:yum_quick/core/common/widgets/is_selected_log_or_sign.dart';

class AppRoutes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String homeRoute = "/home";
  static const String profileRoute = "/profile";
  static const String settingsRoute = "/settings";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String isSelectedLogOrSignRoute = "/isSelectedLogOrSign";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onBoardingRoute,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: loginRoute,
        builder: (context, state) => const LoginView(),
      ),
      // GoRoute(
      //   path: bottomNavBarRoute,
      //   builder: (context, state) => const CustomBottomNavBar(),
      // ),
      GoRoute(
        path: registerRoute,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: isSelectedLogOrSignRoute,
        builder: (context, state) => const IsSelectedLogOrSign(),
      ),
    ],
  );
}
