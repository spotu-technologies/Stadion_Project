import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';

import 'main_screen_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class CustomBottomNavigationBarController extends GetxController {
  static CustomBottomNavigationBarController get to => Get.find();

  RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex(index);
    print('BTM Navi bar index $index $selectedIndex');
    //update();
    //to.update();
    //mainView.update();
  }
}

class CustomBottomNavigationBar
    extends GetView<CustomBottomNavigationBarController> {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(CustomBottomNavigationBarController());
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: colorScheme.background,
        //selectedItemColor: colorScheme.primary,
        //unselectedItemColor: colorScheme.shadow,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: controller.selectedIndex.value,
        onTap: controller.changeIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(
              image: controller.selectedIndex.value == 0
                  ? AssetImage('assets/icons/home_change.png')
                  : AssetImage('assets/icons/home.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: controller.selectedIndex.value == 1
                  ? AssetImage('assets/icons/mom_change.png')
                  : AssetImage('assets/icons/mom.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: controller.selectedIndex.value == 2
                  ? AssetImage('assets/icons/mtc_change.png')
                  : AssetImage('assets/icons/mtc.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: controller.selectedIndex.value == 3
                  ? AssetImage('assets/icons/numbers_change.png')
                  : AssetImage('assets/icons/numbers.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: controller.selectedIndex.value == 4
                  ? AssetImage('assets/icons/wod_change.png')
                  : AssetImage('assets/icons/wod.png'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
