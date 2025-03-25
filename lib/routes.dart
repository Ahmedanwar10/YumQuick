import 'package:go_router/go_router.dart';
import 'package:yum_quick/Features/home/presentation/views/home_view.dart';
import 'package:yum_quick/Features/login/presentation/views/login_view.dart';
import 'package:yum_quick/Features/menu/presentation/views/menu_view.dart';
import 'package:yum_quick/Features/onBoarding/views/widgets/onboarding_screen.dart';
import 'package:yum_quick/Features/register/presentation/views/register_view.dart';

import 'package:yum_quick/Features/splash/views/splash_view.dart';
import 'package:yum_quick/core/common/widgets/bottom_nav_bar.dart';
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
  static const String mainScreenRoute = "/mainScreen";
  static const String isSelectedLogOrSignRoute = "/isSelectedLogOrSign";
  static const String menuViewRoute = "/menuView";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: menuViewRoute,
        builder: (context, state) => const MenuView(),
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
        path: homeRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: isSelectedLogOrSignRoute,
        builder: (context, state) => const IsSelectedLogOrSign(),
      ),
      GoRoute(
        path: mainScreenRoute,
        builder: (context, state) => MainScreen(),
      ),
    ],
  );
}
