import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/login/start_view.dart';

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
    Get.put(LoginViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          CustomAppBar(
            title: 'LOGIN',
            isEnglishTitle: true,
            onLeading: () {
              Get.off(const StartView());
            },
          ),
          const SizedBox(height: 50),
          buildTopMenu(),
          const Spacer(),
          buildBottomMenu(),
          const SizedBox(height: 188),
        ],
      ),
    );
  }

  Row buildBottomMenu() {
    return Row(
      children: [
        const SizedBox(width: 94),
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
