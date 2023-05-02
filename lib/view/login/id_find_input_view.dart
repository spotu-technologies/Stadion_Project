import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'id_find_end_view.dart';

class IdFindInputView extends StatefulWidget {
  const IdFindInputView({Key? key}) : super(key: key);

  @override
  State<IdFindInputView> createState() => _IdFindInputViewState();
}

class _IdFindInputViewState extends State<IdFindInputView> {

  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool emailShow = false;

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
            title: Text('아이디 찾기',
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
                child: Text('회원가입시 입력한                    이메일 주소를 입력해 주세요.',
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
                        emailShow=true;
                      });
                    }
                    else{
                      setState(() {
                        emailShow=false;
                      });
                    }
                  } ,
                  style: TextStyle(fontSize: 30),
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '이메일 주소 입력',
                    suffixIcon: emailShow ?
                    IconButton(
                      padding: EdgeInsets.only(right: 25),
                      onPressed: (){emailController.clear();
                      setState(() {
                        emailShow=false;
                      });},
                      icon: Icon(Icons.cancel, color: Colors.black, size: 30,),) : null,
                  ),
                ),
              ),
              //이메일 입력창
              SizedBox(height: 850),
              GestureDetector(
                onTap: () => Get.to(() => IdFindEndView()),
                child: Container(
                  height: 90,
                  width: 562,
                  decoration: BoxDecoration(
                      color: emailShow ? Colors.yellow[600] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(45)),
                  child: Center(
                    child: Text('아이디 요청하기',
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
              //아이디 요청 버튼
            ],
          ),
        ),
      ),
    );
  }
}
