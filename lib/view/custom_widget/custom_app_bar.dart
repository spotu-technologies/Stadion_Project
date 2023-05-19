import 'package:flutter/material.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.title,
    required this.onLeading,
    required this.onLeadingSearch,
    required this.onLeadingImage,
    this.withAction = false,
    this.withMenu = false,
    this.onDarkTheme = false,
    this.isEnglishTitle = true,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool withMenu;
  final bool withAction;
  final bool onDarkTheme;
  final VoidCallback onLeading;
  final VoidCallback onLeadingSearch;
  final VoidCallback onLeadingImage;
  final bool isEnglishTitle;

  @override
  Widget build(BuildContext context) {
    print('build custom appbar');
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
                    onTap: onLeading,
                    child: Icon(
                      withMenu ? Icons.menu_outlined : Icons.arrow_back,
                      color: onDarkTheme
                          ? colorScheme.background
                          : colorScheme.shadow,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 494),
                if (withAction)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onLeadingSearch,
                        child: Icon(
                          Icons.search,
                          size: 50,
                        ),
                      ),
                      const SizedBox(width: 18),
                      GestureDetector(
                        onTap: onLeadingImage,
                        child: Icon(
                          Icons.circle,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: isEnglishTitle
                  ? textThemeEn.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: onDarkTheme
                          ? colorScheme.background
                          : colorScheme.shadow,
                    )
                  : textThemeKo.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: onDarkTheme
                          ? colorScheme.background
                          : colorScheme.shadow,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
