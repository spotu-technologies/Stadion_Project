import 'package:flutter/material.dart';
import 'package:stadion_project/style_config/color_scheme.dart';

class ButtonWithRollover extends StatelessWidget {
  const ButtonWithRollover({
    required this.onTap,
    this.width = 558,
    this.height = 90,
    this.splashColor = Colors.yellow,
    this.backgroundColor,
    this.child,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;

  final Color? backgroundColor;
  final Color splashColor;
  final VoidCallback onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.hardEdge,
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: colorScheme.background),
      child: Material(
        child: InkWell(
          onTap: onTap,
          splashColor: colorScheme.primary,
          highlightColor: colorScheme.primary,
          child: child,
        ),
      ),
    );
  }
}
