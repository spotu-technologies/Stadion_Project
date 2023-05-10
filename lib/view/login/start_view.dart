import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/login/login_view.dart';

import '../login_membership/membership_agreement_view.dart';

//로그인 초기화면에 해당하는 뷰
class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.shadow,
      body: Stack(
        children: [
          //백그라운드 이미지, 스택은 children 중 가장 큰 사이즈에 크기를 맞춤 -> 이미지로 크기 지정한 셈
          Image.asset(
            'assets/images/login_image.png',
            width: 750,
            height: 1624,
          ),
          //stack 내에선 Positioned 와 Align 위젯을 통해 위치 배치가 가능하며, Stack 자체의 alignment 파라미터를 이용할 수도 있음
          Positioned(
            top: 657,
            child: SizedBox(
              width: 750,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 340,
                    height: 40.6,
                    child: SvgPicture.asset(
                      'assets/images/stadion_logo.svg',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 1252,
            //위젯을 선택한 뒤 우클릭-refactor-extract method를 실행하면 해당 위젯을 build메소드 형태로 뺄 수 있음.
            //콤마나 괄호 단위 선택에 따라 잘 안되는 경우 있으니 유의
            child: buildButtons(),
          ),
        ],
      ),
    );
  }

  Column buildButtons() {
    return Column(
      children: [
        SizedBox(
          width: 750,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //롤오버를 위해 추가된 버튼 위젯
              ButtonWithRollover(
                onTap: () {
                  //Get.to의 경우 해당 페이지로 이동하되, 기존 페이지 루트를 스택처럼 쌓아두는 형식
                  //Get.off or Get.offAll은 기존 루트 제거
                  Get.to(const LoginView());
                },
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
        const SizedBox(height: 30),
        SizedBox(
          width: 750,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //롤오버를 위해 추가된 버튼 위젯
              ButtonWithTextRollover(
                title: '계정이 없으신가요? 가입하기',
                onTap: () {
                  Get.to(const LoginMembershipAgreementView());
                },

              ),
            ],
          ),
        )
      ],
    );
  }
}
