import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_member_id_input.dart';

class LoginMemberAgreementView extends StatefulWidget {
  const LoginMemberAgreementView({Key? key}) : super(key: key);

  @override
  State<LoginMemberAgreementView> createState() => _LoginMemberAgreementViewState();
}

class _LoginMemberAgreementViewState extends State<LoginMemberAgreementView> {

  bool isCheckAll = false;
  bool isCheckSelect = false;

  List<bool> isCheckedList = [false, false, false, false];

  /// 전체 체크/해제 동시
  void checkChangeAll(bool state) {
    for (int i = 0; i < isCheckedList.length; i++) {
      isCheckedList[i] = state;
    }
    /// 상태가 바뀌었음을 알림
    setState(() {
    });
  }

  checkBoxSelect() {

    setState(() {
    });

    bool flag = true;
    for(int i=0; i<isCheckedList.length;i++) {
      if( !isCheckedList[i] ) {
        flag = false;
        break;
      }
    }
    isCheckAll = flag;
  }

  checkBoxSelect2() {
    setState(() {});
    bool flag = true;
    for(int i=0; i<isCheckedList.length-1;i++) {
      //print("i: $i "); // for문이 i몇번까지 도는지 확인
      //if(isCheckedList[i] == false) {
      if( !isCheckedList[i] ) {
        flag = false;
        break; // 하나라도 찾았으면 뒤로는 안봐도 된다
      }
    }
    isCheckSelect = flag;
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
              '회원가입',
              style: TextStyle(
                fontSize: 32,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Get.back(),
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
                child: Text(
                  '스타디온 서비스 이용약관에     동의해주세요.',
                  style: TextStyle(
                    fontSize: 48,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    height: 1.1,
                    letterSpacing: -2.4,
                  ),
                ),
              ),
              // 동의 문구
              SizedBox(height: 107),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      value: isCheckAll,
                      onChanged: (value) {
                        isCheckAll = value!;
                        checkChangeAll(isCheckAll);
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    '모두 동의 (선택 정보 포함)',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              // 모두 동의
              SizedBox(height: 15),
              Container(
                width: 562,
                height: 2,
                color: Colors.black,
              ),
              // 밑줄
              SizedBox(
                height: 9,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('약관을 꼭 확인하시기 바랍니다',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey[600]
                  ),
                ),
              ),
              //약관 확인
              SizedBox(
                height: 45,
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      value: isCheckedList[0],
                      onChanged: (value) {
                        setState(() {
                          // isCheck1 = value!;
                          // checkStateAll();
                          isCheckedList[0] = value!;
                          checkBoxSelect();
                          checkBoxSelect2();
                        });
                      },
                    ),
                  ),
                  Text(
                    '[필수] 만 14세 이상',
                    style: TextStyle(
                      letterSpacing: -1.6,
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              //첫번째 동의
              SizedBox(height: 15),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      value: isCheckedList[1],
                      onChanged: (value) {
                        setState(() {
                          //isCheck2 = value!;
                          //checkStateAll();
                          isCheckedList[1] = value!;
                          checkBoxSelect();
                          checkBoxSelect2();
                        });
                      },
                    ),
                  ),
                  Text(
                    '[필수] 이용약관 동의',
                    style: TextStyle(
                      letterSpacing: -1.6,
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '보기',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
              //두번째 동의
              SizedBox(height: 15),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      value: isCheckedList[2],
                      onChanged: (value) {
                        setState(() {
                          //isCheck3 = value!;
                          //checkStateAll();
                          isCheckedList[2] = value!;
                          checkBoxSelect();
                          checkBoxSelect2();
                        });
                      },
                    ),
                  ),
                  Text(
                    '[필수] 개인정보 처리방침 동의',
                    style: TextStyle(
                      letterSpacing: -1.6,
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '보기',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
              //세번째 동의
              SizedBox(height: 15),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      value: isCheckedList[3],
                      onChanged: (value) {
                        setState(() {
                          //isCheck4 = value!;
                          //checkStateAll();
                          isCheckedList[3] = value!;
                          checkBoxSelect();
                        });
                      },
                    ),
                  ),
                  Text(
                    '[선택] 광고성 정보 수신 및 마케팅 활용 동의',
                    style: TextStyle(
                      letterSpacing: -1.6,
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '보기',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
              //네번째 동의
              SizedBox(height: 563),
              GestureDetector(
                onTap: isCheckAll || isCheckSelect ? () => Get.to(() => LoginMemberIdInputView()) : () => Get.to(() => false),
                child: Container(
                  height: 90,
                  width: 562,
                  decoration: BoxDecoration(
                      color: isCheckAll || isCheckSelect ? Colors.yellow[600] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(45)),
                  child: Center(
                    child: Text('동의하고 가입하기',
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
              //동의 버튼
            ],
          ),
        ),
      ),
    );
  }

}

