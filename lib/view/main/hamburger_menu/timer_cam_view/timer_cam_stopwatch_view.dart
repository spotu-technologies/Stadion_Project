import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/custom_text.dart';
import 'package:stadion_project/view/custom_widget/view_container/view_container.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

//로그인 뷰에서 사용될 Get X controller.
class TimerCamStopWatchViewController extends GetxController {
  final CountDownController TimeController = CountDownController();

  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  String _elapsedTime = '00:00';
  var _isRunning = false;

  void _clickButton() {
    _isRunning = !_isRunning; // 상태 반전

    if (_isRunning) {
      _startTimer();
      TimeController.resume();
    } else {
      _stopTimer();
      TimeController.pause();
    }
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 0), (Timer timer) {
      _elapsedTime = _formatTime(_stopwatch.elapsedMilliseconds);
      update();
    });
  }

  void _stopTimer() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  String _formatTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }
}

class TimerCamStopWatchView extends GetView<TimerCamStopWatchViewController> {
  const TimerCamStopWatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(TimerCamStopWatchViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: GetBuilder<TimerCamStopWatchViewController>(builder: (controller) {
        return Stack(
          children: [
            ///바탕 이미지
            Image.asset(
              'assets/images/timer_cam_stopwatch_image.png',
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
            Center(
              child: Image.asset(
                'assets/images/timer_cam_stopwatch.png',
                width: 562,
                height: 562,
                //fit: BoxFit.cover,
              ),
            ),

            ///appbar
            PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  iconTheme: IconThemeData(
                    color: colorScheme.background,
                    size: 50,
                  ),
                ),
              ),
            ),

            ///stop watch 마크
            Positioned(
              top: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 94),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ViewContainer(
                          width: 80,
                          height: 80,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: colorScheme.onError,
                          child: TitleSmallText(
                            text: 'STOP\nWATCH',
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.background,
                            letterSpacing: -2.4,
                          ),
                        ),
                        SizedBox(width: 482),
                      ],
                    ),
                    const SizedBox(height: 167),
                    NeonCircularTimer(
                      onComplete: () {
                        controller.TimeController.restart();
                      },
                        width: 540,
                        duration: 60,
                        controller: controller.TimeController,
                      strokeWidth: 23,
                      isTimerTextShown: false,
                      neumorphicEffect: false,
                      outerStrokeColor: Colors.transparent,
                      autoStart: false,
                      innerFillGradient: LinearGradient(colors: [
                        colorScheme.onError,
                        colorScheme.onError,
                      ]),
                      neonGradient: LinearGradient(colors: [
                        colorScheme.onError,
                        colorScheme.onError,
                      ]),
                        strokeCap: StrokeCap.round,
                    ),
                  ],
                ),
              ),
            ),

            ///stop watch 및 비디오 녹화 버튼
            Positioned(
              top: 450,
              left: 94,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller._clickButton();
                      //controller._clickCircularButton();
                    },
                    child: Container(
                      width: 562,
                      height: 562,
                      child: Column(
                        children: [
                          const SizedBox(height: 220),
                          DisplayMediumText(
                            text: controller._elapsedTime,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onError,
                          ),
                          const SizedBox(height: 59),
                          HeadlineSmallText(
                            text: controller._isRunning ? '탭하면 정지합니다!' : '탭하면 시작합니다!',
                            fontWeight: FontWeight.w600,
                            color: colorScheme.background,
                            letterSpacing: -1.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/timer_cam_recording.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  HeadlineSmallText(
                    text: '비디오 녹화 중',
                    fontWeight: FontWeight.w600,
                    color: colorScheme.background,
                    letterSpacing: -1.5,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
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
