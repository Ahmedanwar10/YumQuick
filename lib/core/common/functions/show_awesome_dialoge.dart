import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

showAwesomeDialouge(
  BuildContext context, {
  required String message,
  @required String? title,
  @required DialogType? dialogType,
  @required VoidCallback? onOkPressed,
  @required String? buttonText,
  @required Color? buttonColor,
}) {
  AwesomeDialog(
    context: context,
    title: title ?? 'Error',
    dismissOnTouchOutside: true,
    dialogType: dialogType ?? DialogType.error,
    desc: message,
    btnCancelText: buttonText ?? 'Ok',
    btnOkOnPress: onOkPressed ?? () {},
    btnOkColor: buttonColor ?? Colors.red,
  ).show();
}
