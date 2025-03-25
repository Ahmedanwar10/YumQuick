import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yum_quick/core/resources/app_style.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.controller,
    this.isSecure = false,
    this.inputFormatters,
    this.keyboardType,
    this.suffix,
    this.enabled = true,
    this.validator,
  });

  final String hint;
  final bool isSecure;
  final Widget? suffix;
  final bool enabled;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: widget.validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field can\'t be empty';
            }
            return null;
          },
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      cursorColor: ColorManager.primary,
      obscureText: widget.isSecure ? !_isPasswordVisible : false,
      style: const TextStyle(color: ColorManager.dark, fontSize: 12),
      decoration: InputDecoration(
        suffixIcon: widget.isSecure
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: ColorManager.primary,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : widget.suffix,
        hintText: widget.hint,
        filled: true,
        enabled: widget.enabled,
        fillColor: ColorManager.colorButtonSign,
        hintStyle: const TextStyle(color: ColorManager.dark, fontSize: 12),
        border: createBorder(),
        enabledBorder: createBorder(),
        focusedBorder: createBorder(Theme.of(context).primaryColor),
        disabledBorder: createBorder(),
      ),
    );
  }

  OutlineInputBorder createBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: ColorManager.colorHeader,
      ),
    );
  }
}
