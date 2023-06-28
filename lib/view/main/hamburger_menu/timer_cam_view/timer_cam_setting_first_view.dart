import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamSettingFirstViewController extends GetxController {}

class TimerCamSettingFirstView
    extends GetView<TimerCamSettingFirstViewController> {
  const TimerCamSettingFirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TimerCamSettingFirstViewController());
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
                height: 1076,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: colorScheme.background.withOpacity(0.7),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                const SizedBox(height: 100),
                SizedBox(
                  width: 562,
                  child: HeadlineSmallText(
                    text: '배경화면 설정',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.shadow,
                    letterSpacing: -1.5,
                  ),
                ),
                const SizedBox(height: 34),
                Row(
                  children: [
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        Container(
                          width: 210,
                          height: 412,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 2,
                              color: colorScheme.shadow,
                            ),
                          ),
                          child: Icon(
                            Icons.add_circle_outline,
                            size: 60,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 210,
                          child: LabelLargeText(
                            text: '현재 배경화면',
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -1.4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 61),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 210,
                            height: 412,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 2,
                                color: colorScheme.shadow,
                              ),
                            ),
                            child: Icon(
                              Icons.add_circle_outline,
                              size: 60,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 210,
                          child: LabelLargeText(
                            text: '새 배경화면',
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w300,
                            letterSpacing: -1.4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ButtonWithRollover(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      '로그인하기',
                      style: textThemeKo.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///저장버튼
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Row(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
