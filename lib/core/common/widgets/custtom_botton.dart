import 'package:flutter/material.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class CustomButtonText extends StatelessWidget {
  const CustomButtonText({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.color,
    this.icon,
    this.textStyle,
  });

  final String text;
  final VoidCallback onPressed;
  final Widget? icon;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipPath(
        child: Container(
          width: width, //
          height: height, //
          decoration: BoxDecoration(
            color: color ?? ColorManager.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(2, 4), //
              )
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: textStyle ??
                const TextStyle(
                  color: ColorManager.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
