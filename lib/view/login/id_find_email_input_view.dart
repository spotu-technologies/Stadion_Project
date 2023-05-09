import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';

import '../../style_config/text_theme.dart';
import '../custom_widget/buttons/button_with_rollover.dart';
import '../custom_widget/text_field/login_text_field.dart';
import 'login_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class IdFindViewController extends GetxController {
  bool emailShow = false;

  var emailController = TextEditingController();

  void emailInputField(bool emailShow) {
    this.emailShow = emailShow;
    update();
  }
}

class IdFindView extends GetView<IdFindViewController> {
  const IdFindView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(IdFindViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          //추가한 커스텀 앱 바 위젯 (추후 좀 더 파라미터나 세부 위젯 추가필요)
          CustomAppBar(
            title: '아이디 찾기',
            isEnglishTitle: true,
            onLeading: () {
              //off를 통해 view를 빠져나갈 시 기존 페이지를 dispose
              Get.off(const LoginView());
            },
          ),
          const SizedBox(height: 50),
          // 아래처럼 메소드에 ///를 통해 주석을 적은 경우 마우스를 대서 설명 확인 가능

        ],
      ),
    );
  }


}
