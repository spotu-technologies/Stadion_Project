import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';

import '../../../style_config/text_theme.dart';
import '../../custom_widget/buttons/button_with_rollover.dart';
import '../../custom_widget/custom_login_text.dart';

//로그인 뷰에서 사용될 Get X controller.
class SexPopupViewController extends GetxController {
  List<String> sexSelectedList = ['남자', '여자'];
  int _selectedSex = 0;
}

class SexPopupView extends GetView<SexPopupViewController> {
  const SexPopupView({Key? key, required this.applySexAtSub}) : super(key: key);

  final Function(bool) applySexAtSub;

  @override
  Widget build(BuildContext context) {
    Get.put(SexPopupViewController());
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      alignment: const Alignment(0.0, -0.75),
      shadowColor: colorScheme.shadow.withOpacity(0.1),
      content: Stack(
        children: [
          ///바탕 스타일
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                width: 662,
                height: 750,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: colorScheme.onSurface.withOpacity(0.1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x1a000000),
                      offset: Offset(6, 6),
                      blurRadius: 6,
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
          ),

          ///popup 스타일
          Container(
            width: 662,
            height: 750,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                SizedBox(height: 100),
                PopupText(text: '성별'),
                const SizedBox(height: 126),
                Container(
                  width: 420,
                  height: 2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      //begin: Alignment(0,0.5),
                      //end: Alignment(1,0.5),
                      colors: [
                        Color(0x00ffffff),
                        Color(0xff848484),
                        Color(0x00ffffff)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 142),
                Container(
                  width: 420,
                  height: 2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      //begin: Alignment(0,0.5),
                      //end: Alignment(1,0.5),
                      colors: [
                        Color(0x00ffffff),
                        Color(0xff848484),
                        Color(0x00ffffff)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///CupertinoPicker 스타일
          Positioned(
            //top: 240,
            child: Container(
              height: 670,
              child: CupertinoPicker(
                magnification: 2,
                squeeze: 0.5,
                itemExtent: 50,
                selectionOverlay: null,
                onSelectedItemChanged: (int selectedItem) {
                  controller._selectedSex = selectedItem;
                },
                children: List<Widget>.generate(
                    controller.sexSelectedList.length, (int index) {
                  return Center(
                    child: Text(
                      controller.sexSelectedList[index],
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          ///저장버튼
          Positioned(
            top: 20,
            left: 50,
            right: 50,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.close,
                          size: 50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 468),
                ButtonWithRollover(
                  onTap: () {
                    if(controller._selectedSex==0) {
                      applySexAtSub(true);
                    }
                    else {
                      applySexAtSub(false);
                    }
                    Get.back();
                  },
                  backgroundColor: colorScheme.background,
                  child: Center(
                    child: Text(
                      '저장하기',
                      style: textThemeKo.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.surfaceVariant,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
