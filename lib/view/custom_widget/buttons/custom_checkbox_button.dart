import 'package:flutter/material.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stadion_project/style_config/text_theme.dart';

class CustomCheckboxAll extends StatelessWidget {
  const CustomCheckboxAll({
    required this.value,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: GFCheckbox(
        size: 30,
        activeBgColor: colorScheme.background,
        activeBorderColor: colorScheme.shadow,
        inactiveBorderColor: colorScheme.onSurface,
        onChanged: onChanged,
        value: value,
        inactiveIcon: Icon(
          Icons.check,
          color: colorScheme.onSurface,
        ),
        activeIcon: Icon(
          Icons.check,
          color: colorScheme.shadow,
        ),
      ),
    );
  }
}


class CustomCheckboxSelect extends StatelessWidget {
  const CustomCheckboxSelect({
    required this.value,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: GFCheckbox(
        size: 30,
        activeBgColor: colorScheme.background,
        activeBorderColor: colorScheme.background,
        inactiveBorderColor: colorScheme.background,
        onChanged: onChanged,
        value: value,
        inactiveIcon: Icon(
          Icons.check,
          color: colorScheme.onSurface,
        ),
        activeIcon: Icon(
          Icons.check,
          color: colorScheme.shadow,
        ),
      ),
    );
  }
}
