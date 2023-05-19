import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';

//로그인 뷰에서 사용될 Get X controller.
class DrawerViewController extends GetxController {}

class DrawerView extends GetView<DrawerViewController> {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(DrawerViewController());
    return Container(
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
    );
  }
}
