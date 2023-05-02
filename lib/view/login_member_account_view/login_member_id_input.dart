import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_member_password_input.dart';

class LoginMemberIdInputView extends StatefulWidget {
  const LoginMemberIdInputView({Key? key}) : super(key: key);

  @override
  State<LoginMemberIdInputView> createState() => _LoginMemberIdInputViewState();
}

class _LoginMemberIdInputViewState extends State<LoginMemberIdInputView> {

  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool idShow = false;

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
            title: Text('회원가입',
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
                child: Text('로그인에 사용할                       아이디를 입력해 주세요.',
                  style: TextStyle(
                    fontSize: 48,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    height: 1.1,
                    letterSpacing: -2.4,
                  ),
                ),
              ),
              //타이틀
              SizedBox(height: 87),
              Container(
                height: 90,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.black)),
                  //border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  onChanged: (value){
                    if(value.isNotEmpty){
                      setState(() {
                        idShow=true;
                      });
                    }
                    else{
                      setState(() {
                        idShow=false;
                      });
                    }
                  } ,
                  style: TextStyle(fontSize: 30),
                  controller: userController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '아이디 입력',
                    suffixIcon: idShow ?
                    IconButton(
                      padding: EdgeInsets.only(right: 25),
                      onPressed: (){userController.clear();
                      setState(() {
                        idShow=false;
                      });},
                      icon: Icon(Icons.cancel, color: Colors.black, size: 30,),) : null,
                  ),
                ),
              ),
              //이메일 입력창
              SizedBox(height: 850),
              GestureDetector(
                onTap: () => Get.to(() => LoginMemberPasswordInputView()),
                child: Container(
                  height: 90,
                  width: 562,
                  decoration: BoxDecoration(
                      color: idShow ? Colors.yellow[600] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(45)),
                  child: Center(
                    child: Text('다음',
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
              //다음 버튼
            ],
          ),
        ),
      ),
    );
  }
}
