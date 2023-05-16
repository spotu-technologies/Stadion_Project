import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';

import '../../../style_config/text_theme.dart';
import '../../custom_widget/buttons/button_with_rollover.dart';
import '../../custom_widget/custom_login_text.dart';
import '../../custom_widget/text_field/login_text_field.dart';
import '../../login/login_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class CompletePopupViewController extends GetxController {}

class CompletePopupView extends GetView<CompletePopupViewController> {
  const CompletePopupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CompletePopupViewController());
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      alignment: const Alignment(0.0, -0.8),
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
                height: 540,
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
            height: 540,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                PopupText(text: '회원가입이 완료되었습니다.'),
                const SizedBox(height: 64),
                PopupSmallText(text: '로그인을 하시면\n서비스를 이용하실 수 있습니다.'),
                const SizedBox(height: 90),
                ButtonWithRollover(
                  onTap: () {
                    Get.to(const LoginView());
                  },
                  backgroundColor: colorScheme.background,
                  child: Center(
                    child: Text(
                      '로그인하기',
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
