import 'package:flutter/material.dart';

class CustomSlidingText extends StatelessWidget {
  final Animation<Offset> slidingAnimation;
  final String firstText;
  final String secondText;
  final TextStyle firstTextStyle;
  final TextStyle secondTextStyle;

  const CustomSlidingText({
    super.key,
    required this.slidingAnimation,
    required this.firstText,
    required this.secondText,
    required this.firstTextStyle,
    required this.secondTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                firstText,
                style: firstTextStyle,
              ),
              Text(
                secondText,
                style: secondTextStyle,
              ),
            ],
          ),
        );
      },
    );
  }
}
