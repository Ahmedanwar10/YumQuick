import 'package:flutter/material.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

abstract class AppStyles {


  static TextStyle styleSomarSansBold20(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            :  ColorManager.colorHeader,
        fontFamily: 'SomarSans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
  static TextStyle styleSomarSansBold18(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff3B4148),
        fontFamily: 'SomarSans',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );
  static TextStyle styleSomarSansMedium20(BuildContext context) =>
      const TextStyle(
        color: Colors.white,
        fontFamily: 'SomarSans',
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
  static TextStyle styleSomarSansMedium16(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff100F14),
        fontFamily: 'SomarSans',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle styleSomarSansSemiBold6(BuildContext context) =>
      const TextStyle(
        color: Colors.white,
        fontFamily: 'SomarSans',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
  static TextStyle styleSomarSansSemiBold26(BuildContext context) =>
      const TextStyle(
        color: Color(0xff259D19),
        fontFamily: 'SomarSans',
        fontSize: 26,
        fontWeight: FontWeight.w600,
      );
  static TextStyle styleSomarSansBold16(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff100F14),
        fontFamily: 'SomarSans',
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static TextStyle styleSomarSansRegular16(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff100F14),
        fontFamily: 'SomarSans',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
  static TextStyle styleSomarSansMedium14(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff646363),
        fontFamily: 'SomarSans',
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
  static TextStyle styleSomarSansRegular14(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff100F14),
        fontFamily: 'SomarSans',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
  static TextStyle styleSomarSansBold12(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff100F14),
        fontFamily: 'SomarSans',
        fontSize: 12,
        fontWeight: FontWeight.w700,
      );
  static TextStyle styleSomarSansBold14(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff100F14),
        fontFamily: 'SomarSans',
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );
  static TextStyle styleSomarSansLight10(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff90A4AE),
        fontFamily: 'SomarSans',
        fontSize: 10,
        fontWeight: FontWeight.w300,
      );
  static TextStyle styleSomarSansRegular12(BuildContext context) => TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : const Color(0xff8C9CBB),
        fontFamily: 'SomarSans',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );
}