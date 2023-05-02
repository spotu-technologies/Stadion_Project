import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/style_config/text_theme.dart';

class ButtonWithRollover extends StatelessWidget {
  //생성자를 abcd(this.parameter) 꼴이 아닌 abcd({required this.parameter}) 형태로 선언하면 (중괄호 여부가 중요)
  //추후 클래스를 인스턴스화 할 때 Named Parameter기능을 이용할 수 있다.
  const ButtonWithRollover({
    //해당 위젯(클래스)를 만들 때 반드시 입력받아야 할 파라미터는 required를 붙여 받는다.
    required this.onTap,

    //해당 방식으로도 기본값을 정할 수 있다. 아래 변수 선언부 설명도 참고 바람
    this.width = 558,
    this.height = 90,

    //아래 부분에서 설명한 nullable 변수들. required를 붙이지 않아도 된다
    this.splashColor,
    this.highlightColor,
    this.backgroundColor,
    this.child,
    Key? key,
  }) : super(key: key);

  //추후 해당 위젯에서 사용할 만한 파라미터(옵션)들을 입력 받아 build 부분에서 이를 이용함
  final VoidCallback onTap;

  //이와 같이 ?를 이용하지 않고 선언하여도 위에서 기본값을 지정하면 required를 없앨 수 있다
  final double width;
  final double height;

  final Color? splashColor;
  final Color? highlightColor;

  //변수 타입에 ? 를 붙이면 nullable하게 되어 추후 해당 위젯을 인스턴스화 할 때 required가 필요 없도록 할 수 있다
  //이를 이용해 기본값을 지정해줄 수 있다. (아래 build부분 참조)
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.hardEdge,
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: colorScheme.primary),
      child: Material(
        color: colorScheme.primary,
        child: InkWell(
          onTap: onTap,
          //background를 nullable로 선언하였으나 ??를 통해 기본값을 활용한 예시
          //a ?? b의 구문의 경우 a를 넣되, a가 null인 경우 b로 대체하여 넣겠다는 의미
          splashColor: splashColor ?? colorScheme.background,
          highlightColor: highlightColor ?? colorScheme.background,

          //widget또한 변수로 입력받아 이처럼 사용할 수 있다.
          child: child,
        ),
      ),
    );
  }
}

//Stateful widget처럼 GetXcontroller를 사용
class ButtonWithTextRolloverController extends GetxController {
  bool isTouching = false;

  void onTouching() {
    isTouching = true;
    update();
  }

  void onDismiss() {
    isTouching = false;
    update();
  }
}

class ButtonWithTextRollover extends StatelessWidget {
  const ButtonWithTextRollover({
    required this.title,
    required this.onTap,
    this.width = 558,
    this.height = 90,
    this.splashColor,
    this.highlightColor,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  final double width;
  final double height;

  final Color? splashColor;
  final Color? highlightColor;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    Get.put(ButtonWithTextRolloverController());
    return GetBuilder<ButtonWithTextRolloverController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.onDismiss();
          },
          onTapCancel: () => controller.onDismiss(),
          onPanDown: (details) {
            controller.onTouching();
          },
          child: Container(
            width: width,
            clipBehavior: Clip.hardEdge,
            height: height,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: colorScheme.background),
            child: Center(
              child: Text(
                title,
                style: textThemeEn.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: controller.isTouching ? colorScheme.primary : colorScheme.shadow,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
