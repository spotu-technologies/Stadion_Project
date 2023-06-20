import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/login/password_find_input_view.dart';
import 'package:stadion_project/view/login/start_view.dart';
import 'package:stadion_project/view/splash/splash_second_view.dart';

import '../../style_config/text_theme.dart';
import '../custom_widget/buttons/button_with_rollover.dart';
import '../login_membership/membership_agreement_view.dart';
import '../main/main_screen_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class SplashFirstViewController extends GetxController {
  void onInit() {
    super.onInit();
    Timer(
      Duration(milliseconds: 500),
          () => Get.to(() => SplashSecondView(),transition: Transition.circularReveal),
    );
  }
}

class SplashFirstView extends GetView<SplashFirstViewController> {
  const SplashFirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(SplashFirstViewController());
    return Scaffold(
      backgroundColor: colorScheme.shadow,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 390),
                HeadlineLargeText(
                  text: 'TURN\nON\nYOUR\nENERGY',
                  fontWeight: FontWeight.w300,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
            SizedBox(height: 55),
            Stack(
              children: [
                Center(
                  child: Container(
                    width: 148,
                    height: 76,
                    decoration: BoxDecoration(
                        color: Color(0xff28292c),
                        borderRadius: BorderRadius.circular(38)
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      margin: EdgeInsets.only(left: 6, top: 6, right: 6),
                      decoration: BoxDecoration(
                          color: colorScheme.background,
                          borderRadius: BorderRadius.circular(32)
                      ),
                    ),
                    Container(
                      width: 64,
                      height: 64,
                      margin: EdgeInsets.only(left: 6, top: 6, right: 6),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(32)
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 14),
            Container(
              width: 148,
              height: 151,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      HeadlineLargeText(
                        text: 'F',
                        fontWeight: FontWeight.w100,
                        color: colorScheme.background,
                      ),
                      HeadlineLargeText(
                        text: 'F',
                        fontWeight: FontWeight.w100,
                        color: colorScheme.background,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      HeadlineLargeText(
                        text: 'N',
                        fontWeight: FontWeight.w100,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      Text(''),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
