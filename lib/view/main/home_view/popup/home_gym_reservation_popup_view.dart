import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';

//로그인 뷰에서 사용될 Get X controller.
class HomeGymReservationPopupViewController extends GetxController {

  static const String HomeGymReservationPopupView_ReservationStatus = '31';
  static const String HomeGymReservationPopupView_maximumAttendance = '40 명';

  var date = DateTime.now();

  bool isPg = true;
  bool isGm = true;
  bool isBg = true;
  bool isSj = true;

  void selectPg(bool isPg) {
    this.isPg = isPg;
    update();
  }

  void selectGm(bool isGm) {
    this.isGm = isGm;
    update();
  }

  void selectBg(bool isBg) {
    this.isBg = isBg;
    update();
  }

  void selectSj(bool isSj) {
    this.isSj = isSj;
    update();
  }

  /*int? defaultChoiceIndex;
  final List<String> _choicesList = [
    'PG', 'GM', 'BG', 'SJ', 'SS'
  ];

  void selectIndex(index, value) {

    defaultChoiceIndex = value ? index : null;
    update();
  }*/
}

class HomeGymReservationPopupView
    extends GetView<HomeGymReservationPopupViewController> {
  const HomeGymReservationPopupView({Key? key, required this.applyGymTimeAtSub})
      : super(key: key);

  final Function(String, String) applyGymTimeAtSub;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeGymReservationPopupViewController());
    return GetBuilder<HomeGymReservationPopupViewController>(
        builder: (controller) {
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
                      color: colorScheme.onSurface.withOpacity(0.1),
                      boxShadow: const [
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
                height: 1076,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      ///운동항목선택
                      /*Wrap(
                        spacing: 28,
                        //direction: Axis.horizontal,
                        children: List.generate(controller._choicesList.length, (index) {
                          return ChoiceChip(
                            labelPadding: EdgeInsets.fromLTRB(15, 28, 15, 28),
                            label: LabelLargeText(
                              text: controller._choicesList[index],
                              fontWeight: FontWeight.w300,
                            ),
                            selected: controller.defaultChoiceIndex == index,
                            selectedColor: colorScheme.shadow,
                            backgroundColor: colorScheme.background,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onSelected: (value) {
                              controller.selectIndex(index, value);
                            },
                          );
                        }),
                      ),*/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextTogglePopupButton(
                            onTap: () {
                              controller.selectPg(true);
                              controller.selectGm(false);
                              controller.selectBg(false);
                              controller.selectSj(false);
                            },
                            isEnglish: true,
                            color: controller.isPg
                                ? colorScheme.shadow
                                : controller.isGm
                                    ? colorScheme.background
                                    : controller.isBg
                                        ? colorScheme.background
                                        : controller.isSj
                                            ? colorScheme.background
                                            : colorScheme.background,
                            text: 'PG',
                            isSelected: controller.isPg
                                ? true
                                : controller.isGm
                                    ? false
                                    : controller.isBg
                                        ? false
                                        : controller.isSj
                                            ? false
                                            : false,
                          ),
                          TextTogglePopupButton(
                            onTap: () {
                              controller.selectPg(false);
                              controller.selectGm(true);
                              controller.selectBg(false);
                              controller.selectSj(false);
                            },
                            isEnglish: true,
                            color: controller.isPg
                                ? colorScheme.background
                                : controller.isGm
                                ? colorScheme.shadow
                                : controller.isBg
                                ? colorScheme.background
                                : controller.isSj
                                ? colorScheme.background
                                : colorScheme.background,
                            text: 'GM',
                            isSelected: controller.isPg
                                ? false
                                : controller.isGm
                                ? true
                                : controller.isBg
                                ? false
                                : controller.isSj
                                ? false
                                : false,
                          ),
                          TextTogglePopupButton(
                            onTap: () {
                              controller.selectPg(false);
                              controller.selectGm(false);
                              controller.selectBg(true);
                              controller.selectSj(false);
                            },
                            isEnglish: true,
                            color: controller.isPg
                                ? colorScheme.background
                                : controller.isGm
                                ? colorScheme.background
                                : controller.isBg
                                ? colorScheme.shadow
                                : controller.isSj
                                ? colorScheme.background
                                : colorScheme.background,
                            text: 'BG',
                            isSelected: controller.isPg
                                ? false
                                : controller.isGm
                                ? false
                                : controller.isBg
                                ? true
                                : controller.isSj
                                ? false
                                : false,
                          ),
                          TextTogglePopupButton(
                            onTap: () {
                              controller.selectPg(false);
                              controller.selectGm(false);
                              controller.selectBg(false);
                              controller.selectSj(true);
                            },
                            isEnglish: true,
                            color: controller.isPg
                                ? colorScheme.background
                                : controller.isGm
                                ? colorScheme.background
                                : controller.isBg
                                ? colorScheme.background
                                : controller.isSj
                                ? colorScheme.shadow
                                : colorScheme.background,
                            text: 'SJ',
                            isSelected: controller.isPg
                                ? false
                                : controller.isGm
                                ? false
                                : controller.isBg
                                ? false
                                : controller.isSj
                                ? true
                                : false,
                          ),
                          TextTogglePopupButton(
                            onTap: () {
                              controller.selectPg(false);
                              controller.selectGm(false);
                              controller.selectBg(false);
                              controller.selectSj(false);
                            },
                            isEnglish: true,
                            color: controller.isPg
                                ? colorScheme.background
                                : controller.isGm
                                ? colorScheme.background
                                : controller.isBg
                                ? colorScheme.background
                                : controller.isSj
                                ? colorScheme.background
                                : colorScheme.shadow,
                            text: 'SS',
                            isSelected: controller.isPg
                                ? false
                                : controller.isGm
                                ? false
                                : controller.isBg
                                ? false
                                : controller.isSj
                                ? false
                                : true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      ///날짜
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('MMdd').format(controller.date),
                            style: textThemeKo.headlineSmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          HeadlineSmallText(
                            text: ' MoM TRAINING',
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      ///예약인원수
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: HomeGymReservationPopupViewController.HomeGymReservationPopupView_ReservationStatus,
                            style: textThemeKo.displayLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                ),
                          ),
                          TextSpan(
                            text: '명',
                            style: textThemeEn.labelLarge!
                                .copyWith(fontWeight: FontWeight.w300,
                            letterSpacing: -1.4),
                          ),
                        ]),
                      ),
                      ///총 인원수
                      Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorScheme.background,
                        ),
                        child: Text(HomeGymReservationPopupViewController.HomeGymReservationPopupView_maximumAttendance,
                        textAlign: TextAlign.center,
                        style: textThemeKo.labelLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: colorScheme.shadow,
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),

              ///저장버튼
              Positioned(
                top: 20,
                //left: 50,
                //right: 50,
                child: Column(
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 592),
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
                        //const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 826),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ButtonWithRollover(
                        onTap: () {
                          Get.back();
                        },
                        backgroundColor: colorScheme.background,
                        child: Center(
                          child: Text(
                            '예약하기',
                            style: textThemeKo.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.surfaceVariant,
                            ),
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
    );
  }
}
