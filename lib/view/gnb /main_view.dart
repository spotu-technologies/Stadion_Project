import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login_view.dart';
import 'hamburger_menu/badge_view.dart';
import 'hamburger_menu/faq_view.dart';
import 'hamburger_menu/movement_guide.dart';
import 'hamburger_menu/notice_event_view.dart';
import 'hamburger_menu/pass_vew.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Padding(
          padding: EdgeInsets.only(left: 44, top: 105, right: 44),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('타이틀',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 50,
            ),
            actions: [
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.search,
                  size: 50,
                ),
                color: Colors.black,
              ),
              SizedBox(width: 18),
              Image(
                image: AssetImage('assets/images/그룹 9023.png'),
              ),
            ],
          ),
        ),
      ),
      drawer: SafeArea(
        child: Container(
          width: 656,
          height: 1462,
          child: Drawer(
            child: Column(
              children: [
                Container(
                  height: 310,
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
                          height: 98,
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
                        onTap: () => Get.to(() => MovementGuideView()),
                        child: Container(
                          width: 568,
                          height: 98,
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
                        onTap: () => Get.to(() => NoticeEventView()),
                        child: Container(
                          width: 568,
                          height: 98,
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
                        onTap: () => Get.to(() => NoticeEventView()),
                        child: Container(
                          width: 568,
                          height: 98,
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
                        onTap: () => Get.to(() => BadgeView()),
                        child: Container(
                          width: 568,
                          height: 98,
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
                          height: 98,
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
                        onTap: () => Get.to(() => PassView()),
                        child: Container(
                          width: 568,
                          height: 98,
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
                        onTap: () => Get.to(() => FaqView()),
                        child: Container(
                          width: 568,
                          height: 98,
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
                            onTap: () => Get.to(() => LoginView()),
                            child: Container(
                              width: 300,
                              height: 230,
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
                            height: 230,
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: SizedBox(
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 662,
                height: 2,
                color: Colors.black,
              ),
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black,
                selectedFontSize: 22,
                unselectedFontSize: 22,
                currentIndex: _selectedIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/home.png'),
                      size: 50,
                      color: Colors.black,
                    ),
                    label: 'HOME',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/mom level.png'),
                      size: 50,
                      color: Colors.black,
                    ),
                    label: 'MoM LEVEL',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/mtc.png'),
                      size: 50,
                      color: Colors.black,
                    ),
                    label: 'Mtc',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/numbers.png'),
                      size: 50,
                      color: Colors.black,
                    ),
                    label: 'NUMBERS',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/wod.png'),
                      size: 50,
                      color: Colors.black,
                    ),
                    label: 'WoD',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
