import 'package:flutter/material.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.title,
    this.withAction = true,
    this.withMenu = false,
    this.onDarkTheme = false,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool withMenu;
  final bool withAction;
  final bool onDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 44),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      if (withMenu) {
                      } else {}
                    },
                    child: Icon(
                      withMenu ? Icons.menu_outlined : Icons.arrow_back,
                      color: onDarkTheme ? colorScheme.background : colorScheme.shadow,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 44),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: textThemeKo.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: onDarkTheme ? colorScheme.background : colorScheme.shadow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
