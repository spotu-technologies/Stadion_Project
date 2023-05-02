import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_member_account_view/login_member_agreement.dart';
import 'login_view.dart';

class MainLoginView extends StatelessWidget {
  const MainLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_image.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // 바탕 이미지
        Column(children: [
          Container(
            width: 340,
            height: 40,
            margin: EdgeInsets.only(left: 205, top: 657, right: 205),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Logo-white.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 로고 이미지
          SizedBox(height: 555),
          GestureDetector(
            onTap: () => Get.to(() => LoginView()),
            child: Container(
              height: 90,
              width: 558,
              margin: EdgeInsets.only(right: 96, left: 96),
              decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  borderRadius: BorderRadius.circular(45)),
              child: Center(
                child: Text(
                  '로그인하기',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          // 로그인 버튼
          SizedBox(height: 30),
          GestureDetector(
            onTap: () => Get.to(() => LoginMemberAgreementView()),
            child: Container(
              height: 90,
              width: 558,
              margin: EdgeInsets.only(right: 96, left: 96),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45)),
              child: Center(
                child: Text('계정이 없으신가요? 가입하기',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          // 가입 버튼
        ]),
      ]),
    );
  }
}
