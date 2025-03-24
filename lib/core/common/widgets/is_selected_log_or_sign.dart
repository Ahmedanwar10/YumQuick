import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yum_quick/core/common/widgets/custtom_botton.dart';
import 'package:yum_quick/core/common/widgets/text_siliding.dart';
import 'package:yum_quick/core/constants/assets.dart';
import 'package:yum_quick/core/resources/color_managers.dart';
import 'package:yum_quick/routes.dart';

class IsSelectedLogOrSign extends StatefulWidget {
  const IsSelectedLogOrSign({super.key});

  @override
  State<IsSelectedLogOrSign> createState() => _IsSelectedLogOrSignState();
}

class _IsSelectedLogOrSignState extends State<IsSelectedLogOrSign>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(Assets.imagesLogoSplash),
            const SizedBox(
              height: 26,
            ),
            CustomSlidingText(
              slidingAnimation: slidingAnimation,
              firstText: 'YUM',
              secondText: 'QUICK',
              firstTextStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w800,
                fontSize: 35,
                color: ColorManager.colorHeader,
              ),
              secondTextStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w800,
                fontSize: 35,
                color: ColorManager.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: ColorManager.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: CustomButtonText(
                width: 20,
                color: ColorManager.colorHeader,
                height: 45,
                onPressed: () {
                  context.go(AppRoutes.loginRoute);
                },
                text: 'Log In',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: CustomButtonText(
                width: 20,
                color: ColorManager.colorButtonSign,
                height: 45,
                onPressed: () {
                 context.go(AppRoutes.registerRoute);

                },
                text: 'Sign Up',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
