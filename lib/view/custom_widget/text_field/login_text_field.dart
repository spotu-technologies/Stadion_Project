import 'package:flutter/material.dart';
import 'package:stadion_project/style_config/color_scheme.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    required this.obscureText,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 94),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 90,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colorScheme.shadow)),
        ),
        child: TextFormField(
          onChanged: onChanged,
          controller: controller,
          style: const TextStyle(fontSize: 30),
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            suffixIcon: suffixIcon
          ),
        ),
      ),
    );
  }
}
