import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_member_information.dart';

class LoginMemberPasswordInputView extends StatefulWidget {
  const LoginMemberPasswordInputView({Key? key}) : super(key: key);

  @override
  State<LoginMemberPasswordInputView> createState() => _LoginMemberPasswordInputViewState();
}

class _LoginMemberPasswordInputViewState extends State<LoginMemberPasswordInputView> {

  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordController2 = TextEditingController();
  var emailController = TextEditingController();
  bool passwordShow = false;
  bool passwordShow2 = false;
  bool _isObscure = true;
  bool _isObscure2 = true;

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
                child: Text('로그인에 사용할                       비밀번호를 입력해 주세요.',
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
                //padding: EdgeInsets.only(top: 28),
                alignment: Alignment.centerLeft,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.black)),
                  //border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  onChanged: (value){
                    if(value.isNotEmpty){
                      setState(() {
                        passwordShow=true;
                      });
                    }
                    else{
                      setState(() {
                        passwordShow=false;
                      });
                    }
                  },
                  style: TextStyle(fontSize: 30),
                  obscureText: _isObscure,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '비밀번호 입력',
                    suffixIcon: passwordShow ? IconButton(
                      padding: EdgeInsets.only(right: 25),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                        _isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ) : null,
                  ),
                ),
              ),
              //비밀번호 입력
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('영문포함',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          color: Colors.grey[600]
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('숫자포함',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          color: Colors.grey[600]
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('8-20자 이내',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          color: Colors.grey[600]
                      ),
                    ),
                  ),
                ],
              ),
              //비밀번호 조건 문구
              SizedBox(height: 29),
              Container(
                //padding: EdgeInsets.only(top: 28),
                alignment: Alignment.centerLeft,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.black)),
                  //border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  onChanged: (value){
                    if(value.isNotEmpty){
                      setState(() {
                        passwordShow2=true;
                      });
                    }
                    else{
                      setState(() {
                        passwordShow2=false;
                      });
                    }
                  },
                  style: TextStyle(fontSize: 30),
                  obscureText: _isObscure2,
                  controller: passwordController2,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '비밀번호 확인',
                    suffixIcon: passwordShow2 ? IconButton(
                      padding: EdgeInsets.only(right: 25),
                      onPressed: () {
                        setState(() {
                          _isObscure2 = !_isObscure2;
                        });
                      },
                      icon: Icon(
                        _isObscure2 ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ) : null,
                  ),
                ),
              ),
              //비밀번호 확인
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('비밀번호 일치',
                    style: passwordShow && passwordShow2 ?
                    TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      color:  Colors.black,
                    ) :
                    TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      color:  Colors.grey[600],
                    )
                ),
              ),
              //비밀번호 일치 문구
              SizedBox(height: 630),
              GestureDetector(
                onTap: () => Get.to(() => LoginMemberInformationView()),
                child: Container(
                  height: 90,
                  width: 562,
                  decoration: BoxDecoration(
                      color: passwordShow && passwordShow2 ? Colors.yellow[600] : Colors.grey[300],
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
