import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yum_quick/core/common/widgets/text_siliding.dart';
import 'package:yum_quick/core/constants/assets.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigationHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(Assets.imagesSplashLogo),
        const SizedBox(height: 26),
        CustomSlidingText(
          slidingAnimation: slidingAnimation,
          firstText: 'YUM',
          secondText: 'QUICK',
          firstTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w800,
            fontSize: 35,
            color: ColorManager.primary,
          ),
          secondTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w800,
            fontSize: 35,
            color: ColorManager.white,
          ),
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigationHome() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).go('/onboarding');
    });
  }
}
