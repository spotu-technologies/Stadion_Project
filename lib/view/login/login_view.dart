import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/login/start_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class LoginViewController extends GetxController {
  bool isLogin = true;

  void switchMenu(bool isLogin) {
    this.isLogin = isLogin;
    update();
  }
}

class LoginView extends GetView<LoginViewController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(LoginViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          //추가한 커스텀 앱 바 위젯 (추후 좀 더 파라미터나 세부 위젯 추가필요)
          CustomAppBar(
            title: 'LOGIN',
            isEnglishTitle: true,
            onLeading: () {
              //off를 통해 view를 빠져나갈 시 기존 페이지를 dispose
              Get.off(const StartView());
            },
          ),
          const SizedBox(height: 50),
          // 아래처럼 메소드에 ///를 통해 주석을 적은 경우 마우스를 대서 설명 확인 가능
          buildTopMenu(),
          //현재 텍스트필드는 구현 x, 일단 Spacer로 공간 배치
          const Spacer(),
          buildBottomMenu(),
          const SizedBox(height: 188),
        ],
      ),
    );
  }

  ///하단 아이디 찾기/비밀번호 찾기 메뉴 버튼
  Row buildBottomMenu() {
    return Row(
      children: [
        const SizedBox(width: 94),
        //GetBuilder<Controller> 를 사용하면 해당 컨트롤러의 변수 값이 변경될 때마다 builder 내부의 위젯을 rebuild 함
        GetBuilder<LoginViewController>(builder: (context) {
          return Row(
            children: [
              TextToggleButton(
                isSelected: false,
                text: '아이디 찾기',
                width: 272,
                onTap: () {},
                underLineGap: 28,
              ),
              const SizedBox(width: 8.5),
              Column(
                children: [
                  Container(
                    color: colorScheme.shadow,
                    width: 2,
                    height: 30,
                  ),
                  const SizedBox(width: 2, height: 27.5)
                ],
              ),
              const SizedBox(width: 8.5),
              TextToggleButton(
                isSelected: false,
                text: '비밀번호 찾기',
                width: 272,
                onTap: () {},
                underLineGap: 28,
              ),
            ],
          );
        }),
      ],
    );
  }

  ///상단 로그인/사인업 메뉴 버튼
  Row buildTopMenu() {
    return Row(
      children: [
        const SizedBox(width: 94),
        GetBuilder<LoginViewController>(builder: (context) {
          return Row(
            children: [
              TextToggleButton(
                isSelected: controller.isLogin,
                text: 'LOGIN',
                width: 94,
                onTap: () => controller.switchMenu(true),
              ),
              const SizedBox(width: 39),
              TextToggleButton(
                isSelected: !controller.isLogin,
                text: 'SIGN UP',
                width: 120,
                onTap: () => controller.switchMenu(false),
              ),
            ],
          );
        }),
      ],
    );
  }
}
