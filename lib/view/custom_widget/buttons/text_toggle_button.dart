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
    this.textAlign,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final String text;
  final bool isEnglish;
  final double width;
  final double underLineGap;
  final VoidCallback? onTap;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            textAlign: textAlign,
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


class TextTapButton extends StatelessWidget {
  const TextTapButton({
    required this.isSelected,
    required this.text,
    required this.width,
    required this.height,
    this.isEnglish = true,
    this.onTap,
    this.color,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final String text;
  final bool isEnglish;
  final double width;
  final double height;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Text(
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
      ),
    );
  }
}

class TextTogglePopupButton extends StatelessWidget {
  const TextTogglePopupButton({
    required this.isSelected,
    required this.text,
    this.isEnglish = true,
    this.onTap,
    this.color,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final String text;
  final bool isEnglish;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Text(
          text,
          style: isEnglish
              ? textThemeEn.labelLarge!.copyWith(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w300,
            color: isSelected ? colorScheme.background : Color(0xffa3a2a2),
          )
              : textThemeKo.labelLarge!.copyWith(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w300,
            color: isSelected ? colorScheme.background : Color(0xffa3a2a2),
          ),
        ),
      ),
    );
  }
}
