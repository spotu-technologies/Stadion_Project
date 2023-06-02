import 'package:flutter/material.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';

// 로그인 텍스트
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

//------------------회원가입 텍스트----------------------------
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

//------------------팝업창 텍스트-----------------------------
class PopupText extends StatelessWidget {
  const PopupText({
    required this.text,
    this.isEnglish = true,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
        color: colorScheme.shadow,
      )
          : textThemeKo.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
        color: colorScheme.shadow,
      ),
    );
  }
}

class PopupSmallText extends StatelessWidget {
  const PopupSmallText({
    required this.text,
    this.isEnglish = true,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: isEnglish
          ? textThemeEn.labelLarge!.copyWith(
        fontWeight: FontWeight.w300,
        color: colorScheme.shadow,
      )
          : textThemeKo.labelLarge!.copyWith(
        fontWeight: FontWeight.w300,
        color: colorScheme.shadow,
      ),
    );
  }
}

//------------------햄버거메뉴 텍스트--------------------------
class MainTitle extends StatelessWidget {
  const MainTitle({
    required this.text,
    required this.width,
    Key? key,
  }) : super(key: key);

  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
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

//------------------메인 텍스트------------------------------
class DisplayLargeText extends StatelessWidget {
  const DisplayLargeText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.displayLarge!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.displayLarge!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class DisplayMediumText extends StatelessWidget {
  const DisplayMediumText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.displayMedium!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.displayMedium!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class DisplaySmallText extends StatelessWidget {
  const DisplaySmallText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.displaySmall!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.displaySmall!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class HeadlineLargeText extends StatelessWidget {
  const HeadlineLargeText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.headlineLarge!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.headlineLarge!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class HeadlineMediumText extends StatelessWidget {
  const HeadlineMediumText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.headlineMedium!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.headlineMedium!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class HeadlineSmallText extends StatelessWidget {
  const HeadlineSmallText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.headlineSmall!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.headlineSmall!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class TitleLargeText extends StatelessWidget {
  const TitleLargeText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.titleLarge!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.titleLarge!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class TitleMediumText extends StatelessWidget {
  const TitleMediumText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.titleMedium!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.titleMedium!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class TitleSmallText extends StatelessWidget {
  const TitleSmallText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.titleSmall!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.titleSmall!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class LabelLargeText extends StatelessWidget {
  const LabelLargeText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.labelLarge!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.labelLarge!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class LabelMediumText extends StatelessWidget {
  const LabelMediumText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.labelMedium!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.labelMedium!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class LabelSmallText extends StatelessWidget {
  const LabelSmallText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.labelSmall!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.labelSmall!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class BodyLargeText extends StatelessWidget {
  const BodyLargeText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.bodyLarge!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.bodyLarge!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class BodyMediumText extends StatelessWidget {
  const BodyMediumText({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.bodyMedium!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.bodyMedium!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class BodySmallxt extends StatelessWidget {
  const BodySmallxt({
    required this.text,
    this.isEnglish = true,
    this.color,
    this.letterSpacing,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnglish;
  final Color? color;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isEnglish
          ? textThemeEn.bodySmall!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      )
          : textThemeKo.bodySmall!.copyWith(
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}






