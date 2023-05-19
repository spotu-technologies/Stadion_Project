import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';
import 'package:stadion_project/view/main/wod_view/main_wod_view.dart';
import '../../style_config/text_theme.dart';
import '../custom_widget/buttons/custom_bottomNavigationBar.dart';
import 'home_view/main_home_view.dart';
import 'mom_level_view/main_mom_level_view.dart';
import 'momster_view/main_momster_view.dart';
import 'numbers_view/main_numbers_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MainScreenViewController extends GetxController {

  int _selectedIndex = 0;

  final views = [
    MianHomeView(),
    MianMomLevelView(),
    MianMomsterView(),
    MianNumbersView(),
    MianWodView(),
  ];

  final titleViews = [
    '안녕하세~회원님',
    'MoM Level',
    'MoMster',
    'NUMBERS',
    'WoD',
  ];

   void onItemTap(int index) {
     _selectedIndex = index;
     update();
   }
}

class MainScreenView extends GetView<MainScreenViewController> {
  const MainScreenView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('build MianScreenView');
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MainScreenViewController());
    //Get.put(CustomBottomNavigationBarController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: CustomAppBar(
          title: controller.titleViews[controller._selectedIndex],
          isEnglishTitle: true,
          withMenu: true,
          withAction: true,
          onLeading: () {
            //Get.back();
          },
          onLeadingSearch: (){},
          onLeadingImage: (){},
        ),
      ),
      drawer: Container(
        width: 656,
        height: 1462,
        child: Drawer(
          child: Column(
            children: [
              Container(
                height: 300,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28, top: 84, right: 28),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: ()=>Get.back(),
                              icon: ImageIcon(
                                AssetImage('assets/images/close.png'),
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 424,),
                            IconButton(
                              onPressed: (){},
                              icon: ImageIcon(
                                AssetImage('assets/images/speech bubble.png'),
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: ImageIcon(
                                AssetImage('assets/images/setting.png'),
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        /// 아이콘 버튼
                        SizedBox(height: 50,),
                        Row(
                          children: [
                            Container(
                              child: Image(
                                image: AssetImage('assets/images/avatar.png'),
                                width: 78,
                                height: 78,
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text('general user',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        /// 사진 및 유저 유형
                      ],
                    ),
                  ),
                ),
              ),
              ///윗상단 회원 정보
              Padding(
                padding: const EdgeInsets.only(left: 44, top: 130, right: 44),
                child: Column(
                  children: [
                    Container(
                      width: 568,
                      height: 2,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('TIMER CAM',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///팀캠
                    GestureDetector(
                      //onTap: () => Get.to(() => MovementGuideView()),
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('MOVEMENT GUIDE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///가이드
                    GestureDetector(
                      onTap: () {
                        //Get.to(() => NoticeEventView(/*key: noticeKey,*/ isNotice: true,));
                      },
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('NOTICE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///공지사항
                    GestureDetector(
                      onTap: () {
                        //Get.to(() => NoticeEventView(/*key: eventKey, */isNotice: false,));
                      },
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('EVENT',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///이벤트
                    GestureDetector(
                      //onTap: () => Get.to(() => BadgeView()),
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('BADGE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///배치
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('FEED',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///피드백
                    GestureDetector(
                      //onTap: () => Get.to(() => PassView()),
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('PASS',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///패스
                    GestureDetector(
                      //onTap: () => Get.to(() => FaqView()),
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.black)),
                        ),
                        child: Text('FAQ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///질의응답
                    Row(
                      children: [
                        GestureDetector(
                          //onTap: () => Get.to(() => LoginView()),
                          child: Container(
                            width: 300,
                            height: 210,
                            alignment: Alignment.centerLeft,
                            child: Text('LOG OUT',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 268,
                          height: 210,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 66,
                                height: 66,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: ImageIcon(
                                    AssetImage('assets/images/inster.png'),
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 66,
                                height: 66,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: ImageIcon(
                                    AssetImage('assets/images/facebook.png'),
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 66,
                                height: 66,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: ImageIcon(
                                    AssetImage('assets/images/youtube.png'),
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    ///로그아웃
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: controller.views[controller._selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: SizedBox(
          height: 191,
          child: Column(
            children: [
              Container(
                width: 662,
                height: 2,
                color: colorScheme.shadow,
              ),
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                backgroundColor: colorScheme.background,
                selectedItemColor: colorScheme.primary,
                unselectedItemColor: colorScheme.shadow,
                selectedFontSize: 0,
                unselectedFontSize: 0,
                currentIndex: controller._selectedIndex,
                onTap: (index){
                  controller.onItemTap;
                  print(' index $index');
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Image(
                        image: controller._selectedIndex == 0
                            ? AssetImage('assets/icons/home_change.png')
                            : AssetImage('assets/icons/home.png'),
                      ),
                      label: ''
                  ),
                  BottomNavigationBarItem(
                      icon: Image(
                        image: controller._selectedIndex == 1
                            ? AssetImage('assets/icons/mom_change.png')
                            : AssetImage('assets/icons/mom.png'),
                      ),
                      label: ''
                  ),
                  BottomNavigationBarItem(
                      icon: Image(
                        image: controller._selectedIndex == 2
                            ? AssetImage('assets/icons/mtc_change.png')
                            : AssetImage('assets/icons/mtc.png'),
                      ),
                      label: ''
                  ),
                  BottomNavigationBarItem(
                      icon: Image(
                        image: controller._selectedIndex == 3
                            ? AssetImage('assets/icons/numbers_change.png')
                            : AssetImage('assets/icons/numbers.png'),
                      ),
                      label: ''
                  ),
                  BottomNavigationBarItem(
                      icon: Image(
                        image: controller._selectedIndex == 4
                            ? AssetImage('assets/icons/wod_change.png')
                            : AssetImage('assets/icons/wod.png'),
                      ),
                      label: ''
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      /*backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: CustomAppBar(
          title: controller.titleViews[CustomBottomNavigationBarController.to.selectedIndex.value],
          isEnglishTitle: true,
          withMenu: true,
          withAction: true,
          onLeading: () {
            Get.back();
          },
          onLeadingSearch: (){},
          onLeadingImage: (){},
        ),
      ),
      drawer: Container(
        width: 656,
        height: 1462,
        child: Drawer(
          child: Column(
            children: [
              Container(
                height: 300,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28, top: 84, right: 28),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: ()=>Get.back(),
                              icon: ImageIcon(
                                AssetImage('assets/images/close.png'),
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 424,),
                            IconButton(
                              onPressed: (){},
                              icon: ImageIcon(
                                AssetImage('assets/images/speech bubble.png'),
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: ImageIcon(
                                AssetImage('assets/images/setting.png'),
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        /// 아이콘 버튼
                        SizedBox(height: 50,),
                        Row(
                          children: [
                            Container(
                              child: Image(
                                image: AssetImage('assets/images/avatar.png'),
                                width: 78,
                                height: 78,
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text('general user',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        /// 사진 및 유저 유형
                      ],
                    ),
                  ),
                ),
              ),
              ///윗상단 회원 정보
              Padding(
                padding: const EdgeInsets.only(left: 44, top: 130, right: 44),
                child: Column(
                  children: [
                    Container(
                      width: 568,
                      height: 2,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('TIMER CAM',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///팀캠
                    GestureDetector(
                      //onTap: () => Get.to(() => MovementGuideView()),
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('MOVEMENT GUIDE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///가이드
                    GestureDetector(
                      onTap: () {
                        //Get.to(() => NoticeEventView(/*key: noticeKey,*/ isNotice: true,));
                      },
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('NOTICE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///공지사항
                    GestureDetector(
                      onTap: () {
                        //Get.to(() => NoticeEventView(/*key: eventKey, */isNotice: false,));
                      },
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('EVENT',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///이벤트
                    GestureDetector(
                      //onTap: () => Get.to(() => BadgeView()),
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('BADGE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///배치
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('FEED',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///피드백
                    GestureDetector(
                      //onTap: () => Get.to(() => PassView()),
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: Text('PASS',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///패스
                    GestureDetector(
                      //onTap: () => Get.to(() => FaqView()),
                      child: Container(
                        width: 568,
                        height: 90,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.black)),
                        ),
                        child: Text('FAQ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    ///질의응답
                    Row(
                      children: [
                        GestureDetector(
                          //onTap: () => Get.to(() => LoginView()),
                          child: Container(
                            width: 300,
                            height: 210,
                            alignment: Alignment.centerLeft,
                            child: Text('LOG OUT',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 268,
                          height: 210,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 66,
                                height: 66,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: ImageIcon(
                                    AssetImage('assets/images/inster.png'),
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 66,
                                height: 66,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: ImageIcon(
                                    AssetImage('assets/images/facebook.png'),
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 66,
                                height: 66,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: ImageIcon(
                                    AssetImage('assets/images/youtube.png'),
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    ///로그아웃
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => SafeArea(
          child: controller.views[CustomBottomNavigationBarController.to.selectedIndex.value]
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: SizedBox(
          height: 191,
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
      ),*/
    );
  }
}
