import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_login_text.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/drawer_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/popup/movement_guide_view.dart';
import 'package:stadion_project/view/main/main_screen_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MovementGuideViewController extends GetxController {
  var guideController = TextEditingController();

  bool guideShow = false;
  String isGuide = '';

  void nameField(bool guideShow) {
    this.guideShow = guideShow;
    update();
  }

  void applyGuide(String value) {
    isGuide = value;
    guideController.text = '${isGuide}';
    update();
  }

  void GuideFind() {
    Get.dialog(
      GuidePopupView(applyGuideAtSub: applyGuide),
      barrierColor: Colors.transparent,
    );
  }
}

class MovementGuideView extends GetView<MovementGuideViewController> {
  const MovementGuideView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MovementGuideViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //추가한 커스텀 앱 바 위젯 (추후 좀 더 파라미터나 세부 위젯 추가필요)
            CustomAppBar(
              title: 'MOVEMENT GUIDE',
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
              child: Container(
                height: 86,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: colorScheme.shadow),
                      bottom: BorderSide(color: colorScheme.shadow)),
                ),
                child: TextFormField(
                  onTap: () {
                    controller.GuideFind();
                  },
                  controller: controller.guideController,
                  style: textThemeKo.labelLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: colorScheme.shadow,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'CATEGORY',
                    hintStyle: textThemeKo.labelLarge!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: colorScheme.shadow,),
                    suffixIcon: IconButton(
                      onPressed: (){
                        controller.GuideFind();
                      },
                      icon: Icon(Icons.check, color: Colors.black,size: 28,),
                    ),
                  ),
                ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


