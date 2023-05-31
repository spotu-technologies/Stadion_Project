import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_field/login_text_field.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/popup/boxpass_popup_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/popup/movement_guide_popup_view.dart';
import 'package:stadion_project/view/main/main_screen_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class BoxPassViewController extends GetxController {
  var passController = TextEditingController();
  var boxController = TextEditingController();

  String isPass = '';
  String isBox = '';

  void applyPass(String value) {
    isPass = value;
    passController.text = '${isPass}';
    update();
  }

  void applyBox(String value) {
    isBox = value;
    boxController.text = '${isBox}';
    update();
  }

  void PassBoxFind() {
    Get.dialog(
      BoxPassPopupView(applyPassAtSub: applyPass, applyBoxAtSub: applyBox),
      barrierColor: Colors.transparent,
    );
  }
}

class BoxPassView extends GetView<BoxPassViewController> {
  const BoxPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BoxPassViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //추가한 커스텀 앱 바 위젯 (추후 좀 더 파라미터나 세부 위젯 추가필요)
            CustomAppBar(
              title: 'BOX PASS',
              isEnglishTitle: true,
              withAction: true,
              onLeadingSearch: () {},
              onLeadingImage: () {},
              onLeading: () {
                //off를 통해 view를 빠져나갈 시 기존 페이지를 dispose
                Get.off(const MainScreenView());
              },
            ),
            const SizedBox(height: 55),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: Row(
                children: [
                  MainScreenTextFormField(
                    width: 322,
                    onTap: () {
                      controller.PassBoxFind();
                    },
                    controller: controller.passController,
                    hintText: 'PASS',
                  ),
                  const SizedBox(width: 18),
                  MainScreenTextFormField(
                    width: 322,
                    onTap: () {
                      controller.PassBoxFind();
                    },
                    controller: controller.boxController,
                    hintText: 'BOX',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: SizedBox(
          height: 190,
          child: Column(
            children: [
              Container(
                width: 662,
                height: 2,
                color: colorScheme.shadow,
              ),
              CustomBottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}


