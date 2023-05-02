import 'package:flutter/material.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';

class TextToggleButton extends StatelessWidget {
  const TextToggleButton({
    required this.isSelected,
    required this.text,
    required this.width,
    this.isEnglish = true,
    this.underLineGap = 8,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final String text;
  final bool isEnglish;
  final double width;
  final double underLineGap;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: isEnglish
                ? textThemeEn.labelLarge!.copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w300,
                    color: colorScheme.shadow,
                  )
                : textThemeKo.labelLarge!.copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w300,
                    color: colorScheme.shadow,
                  ),
          ),
          SizedBox(height: underLineGap),
          Container(
            width: width,
            height: 4,
            color: isSelected ? colorScheme.primary : Colors.transparent,
          )
        ],
      ),
    );
  }
}
