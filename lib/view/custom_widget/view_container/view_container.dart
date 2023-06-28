import 'package:flutter/material.dart';
import 'package:stadion_project/style_config/color_scheme.dart';

import '../../../style_config/text_theme.dart';

class ViewContainer extends StatelessWidget {
  const ViewContainer({
    this.width,
    this.height,
    this.padding,
    this.alignment,
    this.color,
    this.child,
    Key? key,
  }) : super(key: key);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: child);
  }
}
