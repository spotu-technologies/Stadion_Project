import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/wod_view/popup/wod_box_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamTabataViewController extends GetxController {

  static const String MainTimerCamView_Tabata_TotalTime = '3 X ROUNG TABATA\nTOTAL TIME : 03:30';

}

class TimerCamTabataView extends GetView<TimerCamTabataViewController> {
  const TimerCamTabataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TimerCamTabataViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          ///배경화면
          Image.asset(
            'assets/images/timer_cam_tabata.png',
            width: 750,
            height: 1462,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/timer_cam_black.png',
            width: 750,
            height: 1462,
            fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(0.8),
          ),
          ///엡바
          PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text('TIMER CAM',
                    style: TextStyle(
                      color: colorScheme.background,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                  centerTitle: true,
                  iconTheme: IconThemeData(
                    color: colorScheme.background,
                    size: 50,
                  ),
                  actions: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.search,
                        size: 50,
                      ),
                      color: colorScheme.background,
                    ),
                    //SizedBox(width: 18),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.image_outlined,
                        size: 50,
                      ),
                      color: colorScheme.background,
                    ),
                  ]
              ),
            ),
          ),
          ///페이지 내용
          Positioned(
            child: Column(
              children: [
                const SizedBox(height: 200),
                Row(
                  children: [
                    const SizedBox(width: 94),
                    ViewContainer(
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                      color: colorScheme.secondary,
                      child: TitleSmallText(
                        text: 'TABATA',
                        fontWeight: FontWeight.w600,
                        color: colorScheme.background,
                        letterSpacing: -2.4,
                      ),
                    ),
                    ViewContainer(
                      width: 402,
                      height: 80,
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: HeadlineSmallText(
                        text: TimerCamTabataViewController.MainTimerCamView_Tabata_TotalTime,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.background,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                ViewContainer(
                  width: 662,
                  height: 37,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: HeadlineSmallText(
                    text: 'TABATA',
                    //textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.background,
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  children: [
                    const SizedBox(width: 285),
                    Column(
                      children: [
                        Container(
                          width: 180,
                          height: 2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [const Color(0x00ffffff), const Color(0xff848484), const Color(0x00ffffff)],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        MainScreenPopupTextFormField(
                          width: 120,
                          height: 73,
                          color: Colors.transparent,
                          onTap: () {
                            //controller.LbTimeFind();
                          },
                          style: textThemeEn.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                          hintText: '0',
                          hintStyle: textThemeEn.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 180,
                          height: 2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [const Color(0x00ffffff), const Color(0xff848484), const Color(0x00ffffff)],
                            ),
                          ),
                        ),
                      ],
                    ),
                    LabelLargeText(
                      text: 'ROUNDS',
                      fontWeight: FontWeight.w300,
                      color: colorScheme.background,
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                ViewContainer(
                  width: 662,
                  height: 37,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: HeadlineSmallText(
                    text: 'WORKOUT',
                    //textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 27),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 180,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [const Color(0x00ffffff), const Color(0xff848484), const Color(0x00ffffff)],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            MainScreenPopupTextFormField(
                              width: 240,
                              height: 142,
                              color: Colors.transparent,
                              onTap: () {
                                //controller.LbTimeFind();
                              },
                              style: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                              hintText: '00',
                              hintStyle: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 180,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [const Color(0x00ffffff), const Color(0xff848484), const Color(0x00ffffff)],
                                ),
                              ),
                            ),
                          ],
                        ),
                        LabelLargeText(
                          text: 'M',
                          fontWeight: FontWeight.w300,
                          color: colorScheme.background,
                        ),
                      ],
                    ),
                    const SizedBox(width: 44),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 180,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [const Color(0x00ffffff), const Color(0xff848484), const Color(0x00ffffff)],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            MainScreenPopupTextFormField(
                              width: 240,
                              height: 142,
                              color: Colors.transparent,
                              onTap: () {
                                //controller.LbTimeFind();
                              },
                              style: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                              hintText: '00',
                              hintStyle: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 180,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [const Color(0x00ffffff), const Color(0xff848484), const Color(0x00ffffff)],
                                ),
                              ),
                            ),
                          ],
                        ),
                        LabelLargeText(
                          text: 'S',
                          fontWeight: FontWeight.w300,
                          color: colorScheme.background,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                ViewContainer(
                  width: 662,
                  height: 37,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: HeadlineSmallText(
                    text: 'REST',
                    fontWeight: FontWeight.w600,
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 27),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 180,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [const Color(0x00ffffff), const Color(0xff848484), const Color(0x00ffffff)],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            MainScreenPopupTextFormField(
                              width: 240,
                              height: 142,
                              color: Colors.transparent,
                              onTap: () {
                                //controller.LbTimeFind();
                              },
                              style: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                              hintText: '00',
                              hintStyle: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 180,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [const Color(0x00ffffff), const Color(0xff848484), const Color(0x00ffffff)],
                                ),
                              ),
                            ),
                          ],
                        ),
                        LabelLargeText(
                          text: 'M',
                          fontWeight: FontWeight.w300,
                          color: colorScheme.background,
                        ),
                      ],
                    ),
                    const SizedBox(width: 44),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 180,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [const Color(0x00ffffff), const Color(0xff848484), const Color(0x00ffffff)],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            MainScreenPopupTextFormField(
                              width: 240,
                              height: 142,
                              color: Colors.transparent,
                              onTap: () {
                                //controller.LbTimeFind();
                              },
                              style: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                              hintText: '00',
                              hintStyle: textThemeEn.displayMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 180,
                              height: 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [const Color(0x00ffffff), const Color(0xff848484), const Color(0x00ffffff)],
                                ),
                              ),
                            ),
                          ],
                        ),
                        LabelLargeText(
                          text: 'S',
                          fontWeight: FontWeight.w300,
                          color: colorScheme.background,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 38),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: LabelLargeText(
                        text: 'SET 추가',
                        color: colorScheme.background,
                      ),
                    ),
                    const SizedBox(width: 11),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 45,
                        color: colorScheme.background,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/icons/emom_camera.png'),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: LabelLargeText(
                        text: '비디오 촬영',
                        color: colorScheme.background,
                      ),
                    ),
                    const SizedBox(width: 11),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.check_circle_outline,
                        size: 45,
                        color: colorScheme.background,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
