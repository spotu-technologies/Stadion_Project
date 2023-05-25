import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/button_with_rollover.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/drawer_view.dart';
import 'package:stadion_project/view/main/main_screen_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class NoticeEventViewController extends GetxController {
  
  bool isNotice = true;
  bool isNoticeChanged = false;

  void noticeMenu(bool isNotice) {
    this.isNotice = isNotice;
    update();
  }

  void eventMenu(bool isNoticeChanged) {
    this.isNoticeChanged = isNoticeChanged;
    update();
  }
}

class NoticeEventView extends GetView<NoticeEventViewController> {
  const NoticeEventView({Key? key, required this.isNotice}) : super(key: key);

  final bool isNotice;

  @override
  Widget build(BuildContext context) {
    Get.put(NoticeEventViewController());
    if(!controller.isNoticeChanged) {
      controller.isNotice = controller.isNotice;
    }
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          //추가한 커스텀 앱 바 위젯 (추후 좀 더 파라미터나 세부 위젯 추가필요)
          GetBuilder<NoticeEventViewController>(
              builder: (controller) {
              return CustomAppBar(
                title: controller.isNotice? '공지사항' : '이벤트',
                isEnglishTitle: false,
                withAction: true,
                onLeadingSearch: () {},
                onLeadingImage: () {},
                onLeading: () {
                  //off를 통해 view를 빠져나갈 시 기존 페이지를 dispose
                  Get.off(const MainScreenView());
                },
              );
            }
          ),
          const SizedBox(height: 56),
          const MainTitle(
            text: '새로운 스타디온 소식을\n확인하세요.',
          ),
          const SizedBox(height: 60),
          GetBuilder<NoticeEventViewController>(
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildGestureDetector(
                    onTap: () {
                      controller.noticeMenu(true);
                      controller.eventMenu(true);
                    },
                    color: controller.isNotice? colorScheme.primary : colorScheme.onBackground,
                      text: '공지사항',
                  ),
                  const SizedBox(width: 18),
                  buildGestureDetector(
                    onTap: () {
                      controller.noticeMenu(false);
                      controller.eventMenu(true);
                    },
                    color: controller.isNotice? colorScheme.onBackground : colorScheme.primary,
                    text: '이벤트',
                  ),
                ],
              );
            }
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


class buildGestureDetector extends StatelessWidget {
  const buildGestureDetector({
    required this.text,
    this.onTap,
    this.color,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 322,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Text(
          text,
          style:
          textThemeKo.labelLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}


