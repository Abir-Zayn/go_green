import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.focusNode,
    this.nextFocusNode,
    this.height,
    this.width,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      validator: validator,
      textInputAction:
          nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
      onFieldSubmitted: (_) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
            horizontal: height ?? 20.0, vertical: width ?? 20.0),
        filled: true,
        fillColor: Colors.grey[50],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
