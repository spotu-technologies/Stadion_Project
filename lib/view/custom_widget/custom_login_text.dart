import 'package:flutter/material.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 94),
      child: Container(
        height: 108,
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: textThemeKo.headlineLarge!
              .copyWith(fontWeight: FontWeight.w300, color: colorScheme.shadow),
        ),
      ),
    );
  }
}


class LoginMembershipText extends StatelessWidget {
  const LoginMembershipText({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textThemeKo.bodyMedium!
          .copyWith(fontSize: 28, color: colorScheme.shadow, letterSpacing: -1.4),
    );
  }
}


class PopupText extends StatelessWidget {
  const PopupText({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textThemeKo.headlineSmall!
          .copyWith(fontWeight: FontWeight.w600),
    );
  }
}



