import 'package:flutter/material.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    required this.Text,
    Key? key,
  }) : super(key: key);

  final String Text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 94),
      child: Container(
        height: 108,
      ),
    );
  }
}
