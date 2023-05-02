import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_view.dart';

class PasswordFindEndView extends StatefulWidget {
  const PasswordFindEndView({Key? key}) : super(key: key);

  @override
  State<PasswordFindEndView> createState() => _PasswordFindEndViewState();
}

class _PasswordFindEndViewState extends State<PasswordFindEndView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Padding(
          padding: const EdgeInsets.only(left:44, top: 105, right: 44),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('비밀번호 찾기',
              style: TextStyle(
                fontSize: 32,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: ()=>Get.back(),
              color: Colors.black,
              icon: Icon(
                Icons.arrow_back,
                size: 50,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 94, right: 94),
          child: Column(
            children: [
              Container(
                height: 108,
                alignment: Alignment.center,
                child: Text('비밀번호를 이메일로                     발송해 드렸어요.',
                  style: TextStyle(
                    fontSize: 48,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    height: 1.1,
                    letterSpacing: -2.4,
                  ),
                ),
              ),
              SizedBox(height: 88),
              Container(
                height: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.red),
                  //border: Border.all(color: Colors.black),
                ),
                child: Text('요청하신 비밀번호를 발송하였습니다. 메일을 확인해 주세요!',
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: -1.2,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 850),
              GestureDetector(
                onTap: () => Get.to(() => LoginView()),
                child: Container(
                  height: 90,
                  width: 562,
                  decoration: BoxDecoration(
                      color: Colors.yellow[600],
                      borderRadius: BorderRadius.circular(45)),
                  child: Center(
                    child: Text('다시 로그인하기',
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
            ],
          ),
        ),
      ),
    );
  }
}
