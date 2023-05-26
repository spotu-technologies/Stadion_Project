import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/main_screen_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class FaqViewController extends GetxController {}

class FaqView extends GetView<FaqViewController> {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FaqViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          //추가한 커스텀 앱 바 위젯 (추후 좀 더 파라미터나 세부 위젯 추가필요)
          CustomAppBar(
            title: 'FAG',
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
          MainTitle(
            text: '스타디온에 대해\n궁금하세요?',
          ),
        ],
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
