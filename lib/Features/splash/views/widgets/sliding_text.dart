import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text(
                  'YUM',style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 35,
                    color: ColorManager.primary
                  )
,
                  textAlign: TextAlign.center,
                ),
                 Text(
                  'QUICK',style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 35,
                    color: ColorManager.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        });
  }
}