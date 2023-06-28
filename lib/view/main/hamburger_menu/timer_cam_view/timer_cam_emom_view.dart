import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/text_form_field/login_text_field.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/hamburger_menu/timer_cam_view/timer_cam_emom_forinput_view.dart';
import 'package:stadion_project/view/main/hamburger_menu/timer_cam_view/timer_cam_emom_timercapinput_view.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import 'package:stadion_project/view/main/wod_view/popup/wod_box_popup_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamEmomViewController extends GetxController {

  static const String MainTimerCamView_Emom_TotalTime = '1ROUNG OF EMOM\nTOTAL TIME : 05:00';

  var timeCapController = TextEditingController();
  var forController = TextEditingController();

  bool timeCapShow = false;
  bool forShow = false;

  String isTimeCap = '';
  String isFor = '';

  void applyTimeCap(String value) {
    isTimeCap = value;
    timeCapController.text = '${isTimeCap}';
    update();
  }

  void applyFor(String value) {
    isFor = value;
    forController.text = '${isFor}';
    update();
  }

  void timeCapField(bool timeCapShow) {
    this.timeCapShow = timeCapShow;
    update();
  }

  void forField(bool forShow) {
    this.forShow = forShow;
    update();
  }

  void TimerCapFind() {
    Get.dialog(
      TimerCamEmomTimewCapInputView(
          applyTimeCapAtSub: applyTimeCap),
      barrierColor: Colors.transparent,
    );
  }

  void ForFind() {
    Get.dialog(
      TimerCamEmomForInputView(
          applyForAtSub: applyFor),
      barrierColor: Colors.transparent,
    );
  }
}

class TimerCamEmomView extends GetView<TimerCamEmomViewController> {
  const TimerCamEmomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TimerCamEmomViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          ///배경화면
          Image.asset(
            'assets/images/timer_cam_emom.png',
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
                      color: colorScheme.tertiary,
                      child: TitleSmallText(
                        text: 'EMOM',
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
                        text: TimerCamEmomViewController.MainTimerCamView_Emom_TotalTime,
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
                    text: 'EVERY MINUTE ON A MINUTE',
                    //textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.background,
                  ),
                ),
                const SizedBox(height: 60),
                ViewContainer(
                  width: 662,
                  height: 37,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: HeadlineSmallText(
                    text: 'TIME CAP',
                    //textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.tertiary,
                  ),
                ),
                const SizedBox(height: 27),
                Row(
                  children: [
                    const SizedBox(width: 260),
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
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.timeCapField(true);
                            } else {
                              controller.timeCapField(false);
                            }
                          },
                          onTap: () {
                            controller.TimerCapFind();
                          },
                          controller: controller.timeCapController,
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
                const SizedBox(height: 60),
                ViewContainer(
                  width: 662,
                  height: 37,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: HeadlineSmallText(
                    text: 'FOR',
                    fontWeight: FontWeight.w600,
                    color: colorScheme.tertiary,
                  ),
                ),
                const SizedBox(height: 27),
                Row(
                  children: [
                    const SizedBox(width: 260),
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
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.forField(true);
                            } else {
                              controller.forField(false);
                            }
                          },
                          onTap: () {
                            controller.ForFind();
                          },
                          controller: controller.forController,
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
                const SizedBox(height: 30),
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
                const SizedBox(height: 231),
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
