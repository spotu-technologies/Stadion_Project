import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/main/mom_level_view/popup/body_level_description_popup_view.dart';

import '../../custom_widget/custom_app_bar.dart';

//로그인 뷰에서 사용될 Get X controller.
class MianMomLevelViewController extends GetxController {
  void BodyLevelDescriptionFind() {
    Get.dialog(
      BodyLevelDescriptionPopupView(),
      barrierColor: Colors.transparent,
    );
  }
}

class MianMomLevelView extends GetView<MianMomLevelViewController> {
  const MianMomLevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MianMomLevelViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 55),
                MainTitle(
                  width: 330,
                  text: '당신의 몸 레벨\n칭찬해!',
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 127),
                Row(
                  children: [
                    const SizedBox(width: 486),
                    GestureDetector(
                      onTap: () {
                        controller.BodyLevelDescriptionFind();
                      },
                      child: Row(
                        children: [
                          Text(
                            '몸 레벨 알아보기',
                            style: TextStyle(
                                color: colorScheme.shadow,
                                fontWeight: FontWeight.w300,
                                fontSize: 24,
                                letterSpacing: -1.2),
                          ),
                          const SizedBox(width: 21),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
