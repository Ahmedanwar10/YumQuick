import 'package:flutter/material.dart';
import 'package:yum_quick/Features/onBoarding/views/widgets/onboarding_screen_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingScreenBody(),
    );
  }
}
