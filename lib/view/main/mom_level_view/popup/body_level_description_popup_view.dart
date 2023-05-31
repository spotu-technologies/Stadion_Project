import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';

//로그인 뷰에서 사용될 Get X controller.
class BodyLevelDescriptionPopupViewController extends GetxController {
  bool isPopupScreen = true;
  bool isRun = true;
  bool isBike = true;
  bool isJump = true;

  void selectBodyLevel(bool isPopupScreen) {
    this.isPopupScreen = isPopupScreen;
    update();
  }

  void selectRun(bool isRun) {
    this.isRun = isRun;
    update();
  }

  void selectBike(bool isBike) {
    this.isBike = isBike;
    update();
  }

  void selectJump(bool isJump) {
    this.isJump = isJump;
    update();
  }
}

class BodyLevelDescriptionPopupView
    extends GetView<BodyLevelDescriptionPopupViewController> {
  const BodyLevelDescriptionPopupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BodyLevelDescriptionPopupViewController());
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      //alignment: const Alignment(0.0, -0.5),
      contentPadding: EdgeInsets.only(top: 100),
      shadowColor: colorScheme.shadow.withOpacity(0.1),
      content: GetBuilder<BodyLevelDescriptionPopupViewController>(
          builder: (controller) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                ///바탕 스타일
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                    child: Container(
                      width: 662,
                      height: controller.isPopupScreen ? 2130 : 2540,
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

                ///설명보기
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    height: controller.isPopupScreen ? 2130 : 2540,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x1a000000),
                            offset: Offset(6, 6),
                            blurRadius: 6,
                            spreadRadius: 0)
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.selectBodyLevel(true);
                                    },
                                    child: Container(
                                      width: 272,
                                      height: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: controller.isPopupScreen
                                            ? colorScheme.shadow
                                            : colorScheme.background,
                                      ),
                                      child: Text('MoM LEVEL',
                                          style: controller.isPopupScreen
                                              ? TextStyle(
                                                  color: colorScheme.background,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 28)
                                              : TextStyle(
                                                  color: colorScheme.onSurface,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 28)),
                                    ),
                                  ),
                                  const SizedBox(width: 18),
                                  GestureDetector(
                                    onTap: () {
                                      controller.selectBodyLevel(false);
                                      controller.selectRun(true);
                                      controller.selectBike(false);
                                      controller.selectJump(false);
                                    },
                                    child: Container(
                                      width: 272,
                                      height: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: !controller.isPopupScreen
                                            ? colorScheme.shadow
                                            : colorScheme.background,
                                      ),
                                      child: Text('MOVEMENT\nLEVEL CHART',
                                          style: !controller.isPopupScreen
                                              ? TextStyle(
                                                  color: colorScheme.background,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 28)
                                              : TextStyle(
                                                  color: colorScheme.onSurface,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 28)),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 60),
                              if (controller.isPopupScreen)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 50),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const PopupText(
                                          isEnglish: true,
                                          text: 'MoM LEVEL',
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const PopupSmallText(
                                        textAlign: TextAlign.start,
                                        isEnglish: false,
                                        text: '스타디온 레벨(Stadion Level)은 회원님들의 운동 성취'
                                            '\n도를 평가하는 도구 입니다.'
                                            '\n처음 회원 가입을 하시면, 각 무브먼트, 각 무브먼트 템플'
                                            '\n릿 및 연도, 누적의 레벨은 모두 입문 1단계인 N1부터 시'
                                            '\n작됩니다.',
                                      ),
                                      const SizedBox(height: 38),
                                      buildMomLevelContainer(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                                color: colorScheme.shadow),
                                            bottom: BorderSide(
                                                color: colorScheme.onSurface),
                                          ),
                                        ),
                                        bigText: 'N',
                                        bigColor: colorScheme.primary,
                                        middieText: 'NOVICE',
                                        smallText1: 'N1',
                                        smallColor1: colorScheme.primary,
                                        smallText2: 'N2',
                                        smallColor2: colorScheme.primary,
                                        smallText3: 'N3',
                                        smallColor3: colorScheme.primary,
                                      ),
                                      buildMomLevelContainer(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: colorScheme.onSurface),
                                          ),
                                        ),
                                        bigText: 'I',
                                        bigColor: colorScheme.onSecondaryContainer,
                                        middieText: 'INTERMEDIATE',
                                        smallText1: 'I1',
                                        smallColor1:
                                            colorScheme.onSecondaryContainer,
                                        smallText2: 'I2',
                                        smallColor2:
                                            colorScheme.onSecondaryContainer,
                                        smallText3: 'I3',
                                        smallColor3:
                                            colorScheme.onSecondaryContainer,
                                      ),
                                      buildMomLevelContainer(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: colorScheme.onSurface),
                                          ),
                                        ),
                                        bigText: 'A',
                                        bigColor: colorScheme.tertiary,
                                        middieText: 'ADVANCED',
                                        smallText1: 'A1',
                                        smallColor1: colorScheme.tertiary,
                                        smallText2: 'A2',
                                        smallColor2: colorScheme.tertiary,
                                        smallText3: 'A3',
                                        smallColor3: colorScheme.tertiary,
                                      ),
                                      buildMomLevelContainer(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: colorScheme.shadow),
                                          ),
                                        ),
                                        bigText: 'E',
                                        bigColor: colorScheme.onTertiaryContainer,
                                        middieText: 'ELITE',
                                        smallText1: 'E',
                                        smallColor1:
                                            colorScheme.onTertiaryContainer,
                                        smallText2: '',
                                        smallColor2:
                                            colorScheme.onTertiaryContainer,
                                        smallText3: '',
                                        smallColor3:
                                            colorScheme.onTertiaryContainer,
                                      ),
                                      const SizedBox(height: 29),
                                      const PopupSmallText(
                                        textAlign: TextAlign.start,
                                        isEnglish: false,
                                        text: '이 후, 마이 레코드와 MOM을 통해서 18개 무브먼트의'
                                            '\n기록을 갱신해 나가면, 각 각의 기준에 따라서, 각 레벨이'
                                            '\n기록되고, 올 해의 레벨과 누적 레벨이 갱신되게 됩니다.'
                                            '\n'
                                            '\n평소에는 마이 레코드의 PR을 갱신하다가, MoM이'
                                            '\n열리면, 참가하여 나의 PR은 물론 다른 회원분들과 함께'
                                            '\n즐거운 경쟁을 진행하실 수 있습니다.'
                                            '\n매년 1월 1일이 되면, 올해의 레벨은 초기화 되고, 누적'
                                            '\n레벨은 그대로 유지 됩니다',
                                      ),
                                      const SizedBox(height: 78),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const PopupText(
                                          isEnglish: true,
                                          text: 'ENERGY FLOW',
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const PopupSmallText(
                                        textAlign: TextAlign.start,
                                        isEnglish: false,
                                        text: 'Energy Changes Lives'
                                            '\n삶을 바꾸는 에너지'
                                            '\n'
                                            '\nStadion ENERGY FLOW는 육체적, 정신적 활동의'
                                            '\n원동력인 Energy를 효율적으로 생산하는 Stadion'
                                            '\n회원만의 특별하고 새로운 Movement 입니다.'
                                            '\n'
                                            '\nFlow(몰입)을 사용한 Air, Force, Fly 3 가지의 테마,'
                                            '\n9가지의 Method, 총 18개의 Movement 를 기준으로'
                                            '\n삶의 에너지를 완충시켜 드릴 것 입니다.'
                                            '\n'
                                            '\n매일 그리고 주, 월, 분기, 연간 단위로 당신의'
                                            '\nMovement를 기록하면서 신기록(PR:Personal'
                                            '\nRecord)을 달성해 보세요.',
                                      ),
                                    ],
                                  ),
                                ),
                              if (!controller.isPopupScreen)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 50),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const PopupText(
                                          isEnglish: true,
                                          text: 'ROOT MOVEMENT LEVEL CHART',
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const PopupSmallText(
                                        textAlign: TextAlign.start,
                                        isEnglish: false,
                                        text: '스타디온 레벨(Stadion Level)을 구성하는 각 각의 루트'
                                            '\n무브먼트의 레벨차트입니다.',
                                      ),
                                      const SizedBox(height: 36),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextToggleButton(
                                              isSelected: controller.isRun
                                                  ? true
                                                  : controller.isBike
                                                      ? false
                                                      : controller.isJump
                                                          ? false
                                                          : false,
                                              text: 'AIR\nRUN',
                                              textAlign: TextAlign.center,
                                              width: 130,
                                              onTap: () {
                                                controller.selectRun(true);
                                                controller.selectBike(false);
                                                controller.selectJump(false);
                                              },
                                            ),
                                          TextToggleButton(
                                            isSelected: controller.isRun
                                                ? false
                                                : controller.isBike
                                                ? true
                                                : controller.isJump
                                                ? false
                                                : false,
                                            text: 'AIR\nBIKE',
                                            textAlign: TextAlign.center,
                                            width: 130,
                                            onTap: () {
                                              controller.selectRun(false);
                                              controller.selectBike(true);
                                              controller.selectJump(false);
                                            },
                                          ),
                                          TextToggleButton(
                                            isSelected: controller.isRun
                                                ? false
                                                : controller.isBike
                                                ? false
                                                : controller.isJump
                                                ? true
                                                : false,
                                            text: 'AIR\nJUMP ROPE',
                                            textAlign: TextAlign.center,
                                            width: 130,
                                            onTap: () {
                                              controller.selectRun(false);
                                              controller.selectBike(false);
                                              controller.selectJump(true);
                                            },
                                          ),
                                          TextToggleButton(
                                            isSelected: controller.isRun
                                                ? false
                                                : controller.isBike
                                                ? false
                                                : controller.isJump
                                                ? false
                                                : true,
                                            text: 'FORCE\nPULL',
                                            textAlign: TextAlign.center,
                                            width: 130,
                                            onTap: () {
                                              controller.selectRun(false);
                                              controller.selectBike(false);
                                              controller.selectJump(false);
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      if(controller.isRun)
                                        Column(
                                          children: [
                                            Column(
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                      text: 'G',
                                                      style: textThemeEn.labelSmall!
                                                          .copyWith(fontWeight: FontWeight.w600),
                                                      children:[
                                                        TextSpan(
                                                          text: ' Grade',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w300),
                                                        ),
                                                        TextSpan(
                                                          text: '    L',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w600),
                                                        ),
                                                        TextSpan(
                                                          text: ' Level',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w300),
                                                        ),
                                                        TextSpan(
                                                          text: '    PR',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w600),
                                                        ),
                                                        TextSpan(
                                                          text: ' Personal Record',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w300),
                                                        ),
                                                        TextSpan(
                                                          text: '    P',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w600),
                                                        ),
                                                        TextSpan(
                                                          text: ' Point',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w300),
                                                        ),
                                                      ]
                                                    ),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: 562,
                                                  height: 141,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: colorScheme.background,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 138.5,
                                                        child: Text(
                                                          'AIR\n남자',
                                                          style: TextStyle(
                                                            color: colorScheme.shadow,
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 28,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Text(
                                                            'Run',
                                                            style: TextStyle(
                                                              color: colorScheme.shadow,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 28,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 412,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            children: [
                                                              const SizedBox(width: 102.5),
                                                              Text(
                                                                '1Km',
                                                                style: TextStyle(
                                                                  color: colorScheme.shadow,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 28,
                                                                ),
                                                              ),
                                                              const SizedBox(width: 85),
                                                              Text(
                                                                '5Km',
                                                                style: TextStyle(
                                                                  color: colorScheme.shadow,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 28,
                                                                ),
                                                              ),
                                                              const SizedBox(width: 44.5),
                                                              Text(
                                                                '종합',
                                                                style: TextStyle(
                                                                  color: colorScheme.shadow,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 28,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 59),
                                                    Text('G',
                                                    style: TextStyle(
                                                      color: colorScheme.shadow,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 28,
                                                    ),
                                                    ),
                                                    const SizedBox(width: 140),
                                                    Text('L',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 49),
                                                    Text('R',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 46),
                                                    Text('P',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 44),
                                                    Text('R',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 46),
                                                    Text('P',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 22),
                                                    Text('P',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: 562,
                                                  height: 210,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: colorScheme.primary,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 210,
                                                        child: Text(
                                                          'NOVICE',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'N1',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'N2',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'N3',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 9),
                                                Container(
                                                  width: 562,
                                                  height: 210,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: colorScheme.onSecondaryContainer,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 210,
                                                        child: Text(
                                                          'INTERMEDIATE',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'I1',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'I2',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'I3',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 11),
                                                Container(
                                                  width: 562,
                                                  height: 210,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: colorScheme.tertiary,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 210,
                                                        child: Text(
                                                          'ADVANCED',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'A1',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'A2',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'A3',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: 562,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: colorScheme.onTertiaryContainer,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 210,
                                                        child: Text(
                                                          'ELITE',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'E1',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300),
                                                          ),
                                                          const SizedBox(width: 13),
                                                          Text(
                                                            '0:04:41',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                          ),
                                                          const SizedBox(width: 14),
                                                          Text(
                                                            '10',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300),
                                                          ),
                                                          const SizedBox(width: 13),
                                                          Text(
                                                            '0:29:01',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                          ),
                                                          const SizedBox(width: 14),
                                                          Text(
                                                            '10',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300),
                                                          ),
                                                          const SizedBox(width: 14),
                                                          Text(
                                                            '20',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 40),
                                            Column(
                                              children: [
                                                Container(
                                                  width: 562,
                                                  height: 141,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: colorScheme.background,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 138.5,
                                                        child: Text(
                                                          'AIR\n여자',
                                                          style: TextStyle(
                                                            color: colorScheme.shadow,
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 28,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Text(
                                                            'Run',
                                                            style: TextStyle(
                                                              color: colorScheme.shadow,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 28,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 412,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            children: [
                                                              const SizedBox(width: 102.5),
                                                              Text(
                                                                '1Km',
                                                                style: TextStyle(
                                                                  color: colorScheme.shadow,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 28,
                                                                ),
                                                              ),
                                                              const SizedBox(width: 85),
                                                              Text(
                                                                '5Km',
                                                                style: TextStyle(
                                                                  color: colorScheme.shadow,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 28,
                                                                ),
                                                              ),
                                                              const SizedBox(width: 44.5),
                                                              Text(
                                                                '종합',
                                                                style: TextStyle(
                                                                  color: colorScheme.shadow,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 28,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 59),
                                                    Text('G',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 140),
                                                    Text('L',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 49),
                                                    Text('R',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 46),
                                                    Text('P',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 44),
                                                    Text('R',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 46),
                                                    Text('P',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 22),
                                                    Text('P',
                                                      style: TextStyle(
                                                        color: colorScheme.shadow,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 28,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: 562,
                                                  height: 210,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: colorScheme.primary,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 210,
                                                        child: Text(
                                                          'NOVICE',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'N1',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'N2',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'N3',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 9),
                                                Container(
                                                  width: 562,
                                                  height: 210,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: colorScheme.onSecondaryContainer,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 210,
                                                        child: Text(
                                                          'INTERMEDIATE',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'I1',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'I2',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'I3',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 11),
                                                Container(
                                                  width: 562,
                                                  height: 210,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: colorScheme.tertiary,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 210,
                                                        child: Text(
                                                          'ADVANCED',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'A1',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'A2',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 340.5,
                                                            height: 1,
                                                            color: colorScheme.shadow,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'A3',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:04:41',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 13),
                                                              Text(
                                                                '0:29:01',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '10',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                              const SizedBox(width: 14),
                                                              Text(
                                                                '20',
                                                                style: textThemeEn.labelSmall!
                                                                    .copyWith(fontWeight: FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: 562,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: colorScheme.onTertiaryContainer,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 210,
                                                        child: Text(
                                                          'ELITE',
                                                          style: textThemeEn.labelSmall!
                                                              .copyWith(fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'E1',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300),
                                                          ),
                                                          const SizedBox(width: 13),
                                                          Text(
                                                            '0:04:41',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                          ),
                                                          const SizedBox(width: 14),
                                                          Text(
                                                            '10',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300),
                                                          ),
                                                          const SizedBox(width: 13),
                                                          Text(
                                                            '0:29:01',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300,letterSpacing: -1.5),
                                                          ),
                                                          const SizedBox(width: 14),
                                                          Text(
                                                            '10',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300),
                                                          ),
                                                          const SizedBox(width: 14),
                                                          Text(
                                                            '20',
                                                            style: textThemeEn.labelSmall!
                                                                .copyWith(fontWeight: FontWeight.w300),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      if(controller.isBike)
                                        Container(
                                          child: Text('bike sample',style: TextStyle(fontSize: 50),),
                                        ),
                                      if(controller.isJump)
                                        Container(
                                          child: Text('jump sample',style: TextStyle(fontSize: 50),),
                                        ),
                                      if(!controller.isRun && !controller.isBike && !controller.isJump)
                                        Container(
                                          child: Text('fore sample',style: TextStyle(fontSize: 50),),
                                        ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

class buildMomLevelContainer extends StatelessWidget {
  const buildMomLevelContainer({
    required this.bigText,
    required this.middieText,
    required this.smallText1,
    required this.smallText2,
    required this.smallText3,
    required this.bigColor,
    required this.smallColor1,
    required this.smallColor2,
    required this.smallColor3,
    this.decoration,
    Key? key,
  }) : super(key: key);

  final String bigText;
  final String middieText;
  final String smallText1;
  final String smallText2;
  final String smallText3;
  final Color bigColor;
  final Color smallColor1;
  final Color smallColor2;
  final Color smallColor3;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 562,
      height: 122,
      decoration: decoration,
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Row(
        children: [
          Container(
            width: 170,
            height: 73,
            alignment: Alignment.center,
            child: Text(
              bigText,
              style: textThemeEn.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: bigColor,
                letterSpacing: 0.0,
              ),
            ),
          ),
          const SizedBox(width: 92),
          Container(
            width: 300,
            height: 73,
            //alignment: Alignment(-1.0,0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  middieText,
                  style: textThemeEn.labelSmall!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: colorScheme.shadow,
                      letterSpacing: 0.0),
                ),
                Row(
                  children: [
                    Text(
                      smallText1,
                      style: textThemeEn.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: smallColor1,
                          letterSpacing: 0.0),
                    ),
                    const SizedBox(width: 70),
                    Text(
                      smallText2,
                      style: textThemeEn.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: smallColor2,
                          letterSpacing: 0.0),
                    ),
                    const SizedBox(width: 70),
                    Text(
                      smallText3,
                      style: textThemeEn.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: smallColor3,
                          letterSpacing: 0.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
