import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/main/custom_bottomNavigationBar.dart';
import 'package:stadion_project/view/main/main_menubar_view.dart';
import '../../style_config/text_theme.dart';
import 'home_view/main_home_view.dart';
import 'mom_level_view/main_mom_level_view.dart';
import 'momster_view/main_momster_view.dart';
import 'numbers_view/main_numbers_view.dart';
import 'wod_view/main_wod_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MainScreenViewController extends GetxController {

  //int _selectedIndex = 0;

  final views = [
    MianHomeView(),
    MainMomLevelView(),
    MianMomsterView(),
    MianNumbersView(),
    MianWodView(),
  ];

  final titleViews = [
    '안녕하세~회원님',
    'MoM LEVEL',
    'MoMSTER',
    'NUMBERS',
    'WoD',
  ];
}

class MainScreenView extends GetView<MainScreenViewController> {
  const MainScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build MianScreenView');
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MainScreenViewController());
    Get.put(CustomBottomNavigationBarController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 44),
          child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Obx(() => Text(controller.titleViews[CustomBottomNavigationBarController.to.selectedIndex.value],
                style: TextStyle(
                  color: colorScheme.shadow,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                ),
              ),
              ),
              centerTitle: true,
              iconTheme: IconThemeData(
                color: colorScheme.shadow,
                size: 50,
              ),
              actions: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.search,
                    size: 50,
                  ),
                  color: colorScheme.shadow,
                ),
                //SizedBox(width: 18),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.image_outlined,
                    size: 50,
                  ),
                  color: colorScheme.shadow,
                ),
              ]
          ),
        ),
      ),
      drawer: MainMenuBarView(),
      body: Obx(() => controller.views[CustomBottomNavigationBarController.to.selectedIndex.value]),
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

