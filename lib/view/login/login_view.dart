import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../gnb /main_view.dart';
import '../login_member_account_view/login_member_agreement.dart';
import 'id_find_input_view.dart';
import 'password_find_input_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isObscure = true;
  bool idShow = false;
  bool passwordShow = false;
  final _formKey = GlobalKey<FormState>();
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Padding(
          padding: const EdgeInsets.only(left: 44, top: 105, right: 44),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
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
          padding: const EdgeInsets.only(left: 94, top: 3, right: 94),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.orange,
                        decorationThickness: 2,
                        color: Colors.transparent,
                        shadows: [Shadow(offset: Offset(0,-10), color: Colors.black)],
                        fontSize: 28,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => LoginMemberAgreementView()),
                    child: Text(
                      'SIGNUP',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        decorationThickness: 2,
                        color: Colors.transparent,
                        shadows: [Shadow(offset: Offset(0,-10), color: Colors.black)],
                        fontSize: 28,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              //로그인 사인압 믄지
              SizedBox(height: 159),
              Container(
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
                    hintText: '아이디',
                    suffixIcon: idShow ?
                    IconButton(
                      padding: EdgeInsets.only(right: 25),
                      onPressed: (){userController.clear();
                      setState(() {
                        idShow=false;
                      });},
                      icon: Icon(Icons.cancel, color: Colors.black, size: 30,),
                      /* onTap: () => userController.clear(),
                      child: Icon(
                        Icons.cancel,
                        color: Colors.black,
                        size: 40, */

                    ) : null,
                  ),
                ),
              ),
              // 아이디 입력창
              SizedBox(height: 26),
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
                    hintText: '비밀번호',
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
              //비밀번호 입력창
              SizedBox(height: 90),
              GestureDetector(
                onTap: () => Get.to(() => MainView()),
                child: Container(
                  height: 90,
                  width: 562,
                  decoration: BoxDecoration(
                      color: idShow && passwordShow ? Colors.yellow[600] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(45)),
                  child: Center(
                    child: Text('로그인하기',
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
              //로그인 버튼
              SizedBox(height: 590),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => IdFindInputView()),
                      child: Text('아이디 찾기',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                            color: Colors.transparent,
                            shadows: [Shadow(offset: Offset(0,-10), color: Colors.black)],
                            fontSize: 30,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 30,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => PasswordFindInputView()),
                      child: Text('비밀번호 찾기',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                            color: Colors.transparent,
                            shadows: [Shadow(offset: Offset(0,-10), color: Colors.black)],
                            fontSize: 30,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}




