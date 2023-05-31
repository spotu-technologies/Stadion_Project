import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/buttons/text_toggle_button.dart';

//로그인 뷰에서 사용될 Get X controller.
class MianNumbersViewController extends GetxController {
  bool isMonth = true;
  bool isYear = true;

  void selectMonth(bool isMonth) {
    this.isMonth = isMonth;
    update();
  }

  void selectYear(bool isYear) {
    this.isYear = isYear;
    update();
  }
}

class MianNumbersView extends GetView<MianNumbersViewController> {
  const MianNumbersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MianNumbersViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 55),
            GetBuilder<MianNumbersViewController>(
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextTapButton(
                        onTap: () {
                          controller.selectMonth(true);
                          controller.selectYear(false);
                        },
                        width: 208,
                        isEnglish: true,
                        color: controller.isMonth
                            ? colorScheme.primary
                            : controller.isYear
                            ? colorScheme.onBackground
                            : colorScheme.onBackground,
                        text: 'MONTH',
                        isSelected: controller.isMonth
                            ? true
                            : controller.isYear
                            ? false
                            : false,
                      ),
                      const SizedBox(width: 19),
                      TextTapButton(
                        onTap: () {
                          controller.selectMonth(false);
                          controller.selectYear(true);
                        },
                        width: 208,
                        isEnglish: true,
                        color: controller.isMonth
                            ? colorScheme.onBackground
                            : controller.isYear
                            ? colorScheme.primary
                            : colorScheme.onBackground,
                        text: 'YEAR',
                        isSelected: controller.isMonth
                            ? false
                            : controller.isYear
                            ? true
                            : false,
                      ),
                      const SizedBox(width: 19),
                      TextTapButton(
                        onTap: () {
                          controller.selectMonth(false);
                          controller.selectYear(false);
                        },
                        width: 208,
                        isEnglish: true,
                        color: controller.isMonth
                            ? colorScheme.onBackground
                            : controller.isYear
                            ? colorScheme.onBackground
                            : colorScheme.primary,
                        text: 'ALL',
                        isSelected: controller.isMonth
                            ? false
                            : controller.isYear
                            ? false
                            : true,
                      ),
                    ],
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
