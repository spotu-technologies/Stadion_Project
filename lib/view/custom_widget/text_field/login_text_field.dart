import 'package:flutter/material.dart';
import 'package:stadion_project/style_config/color_scheme.dart';

import '../../../style_config/text_theme.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    required this.obscureText,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final bool obscureText;
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final GestureTapCallback? onTap;

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
          onTap: onTap,
          controller: controller,
          style: textThemeKo.labelLarge!.copyWith(
            fontWeight: FontWeight.w300,
            color: colorScheme.shadow,
          ),
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}


class MembershipTextFormField extends StatelessWidget {
  const MembershipTextFormField({
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 94),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 90,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colorScheme.onSurface)),
        ),
        child: TextFormField(
          onChanged: onChanged,
          onTap: onTap,
          controller: controller,
          style: textThemeKo.labelLarge!.copyWith(
            fontWeight: FontWeight.w300,
            color: colorScheme.shadow,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}


class MembershipTextFormSmallField extends StatelessWidget {
  const MembershipTextFormSmallField({
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 272,
      height: 100,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.onSurface)),
      ),
      child: TextFormField(
        onChanged: onChanged,
        onTap: onTap,
        controller: controller,
        style: textThemeKo.labelLarge!.copyWith(
          fontWeight: FontWeight.w300,
          color: colorScheme.shadow,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}


class PopupTextFormField extends StatelessWidget {
  const PopupTextFormField({
    required this.hintText,
    required this.width,
    this.controller,
    this.onChanged,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final double width;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: width,
      height: 70,
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: TextFormField(
          onChanged: onChanged,
          onTap: onTap,
          controller: controller,
          style: textThemeKo.labelLarge!.copyWith(
            fontWeight: FontWeight.w300,
            color: colorScheme.shadow,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: textThemeKo.labelSmall!.copyWith(
              fontWeight: FontWeight.w300, color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
