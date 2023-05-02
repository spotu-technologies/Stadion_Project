import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'popup/address_popup.dart';
import 'popup/birthday_popup.dart';
import 'popup/height_weight_popup.dart';
import 'popup/sex_popup.dart';

class LoginMemberInformationView extends StatefulWidget {
  const LoginMemberInformationView({Key? key}) : super(key: key);


  @override
  State<LoginMemberInformationView> createState() => _LoginMemberInformationViewState();
}

class _LoginMemberInformationViewState extends State<LoginMemberInformationView> {

  var emailController = TextEditingController();
  var callController = TextEditingController();
  var addressController = TextEditingController();
  var addressController2 = TextEditingController();
  var sexController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var birthdayController = TextEditingController();
  var eventController = TextEditingController();
  var careerController = TextEditingController();

  bool emailShow = false;
  bool callShow = false;
  bool addressShow = false;
  bool addressShow2 = false;
  bool addressShow3 = true;
  bool sexShow = false;
  bool heightShow = false;
  bool weightShow = false;
  bool birthdayShow = false;

  bool isMale = true;
  String isHeight = '';
  String isWeight = '';
  String isYear = '';
  String isMonth = '';
  String isDay = '';

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void applySex(bool value) {
    isMale = value;
    sexController.text = isMale?"남자":"여자";
    //print("current sex: $isMale");
    setState(() {
    });
  }

  void applyHeight(String value) {
    isHeight = value;
    heightController.text = '${isHeight} cm';
    print("current sex: $isHeight");
    setState(() {
    });
  }

  void applyWeight(String value) {
    isWeight = value;
    weightController.text = '${isWeight} kg';
    print("current sex: $isWeight");
    setState(() {
    });
  }

  void applyBirthday(String valueYear, String valueMonth, String valueDay) {
    isYear = valueYear;
    isMonth = valueMonth;
    isDay = valueDay;
    birthdayController.text = '${isYear}. ${isMonth}. ${isDay}';
    print("current sex: $isYear");
    setState(() {
    });
  }

  void AddressFind() {
    Get.dialog(
      AddressFindPopup(),
    );
  }
  void SexFind() {
    Get.dialog(
      SexFindPopup(applySexAtSub: applySex),
    );
  }

  void HeightFind() {
    Get.dialog(
      HeightFindPopup(applyHeightAtSub: applyHeight, applyWeightAtSub: applyWeight),
    );
  }

  void BirthdayFind() {
    Get.dialog(
      BirthdayFindPopup(
          applyBirthdayAtSub:applyBirthday),
    );
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 108,
                  child: Text(
                    '스타디온 앱에서 사용할           추가 정보를 입력해 주세요.',
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
                SizedBox(
                  height: 116,
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '연락처',
                              style: TextStyle(
                                fontSize: 30,
                                letterSpacing: -1.5,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '* 필수',
                              style: TextStyle(
                                fontSize: 24,
                                letterSpacing: -1.2,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        //연락처 문구
                        SizedBox(
                          height: 21,
                        ),
                        Container(
                          width: 562,
                          height: 2,
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                        //밑줄
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 90,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey)),
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
                            },
                            controller: emailController,
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: -1.4,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // 접두어 텍스트
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 34,
                                    child: Text(
                                      '* 이메일',
                                      style: TextStyle(
                                        fontSize: 28,
                                        letterSpacing: -1.4,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //이메일 입력창
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 90,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey)),
                            //border: Border.all(color: Colors.black),
                          ),
                          child: TextFormField(
                            onChanged: (value){
                              if(value.isNotEmpty){
                                setState(() {
                                  callShow=true;
                                });
                              }
                              else{
                                setState(() {
                                  callShow=false;
                                });
                              }
                            },
                            controller: callController,
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: -1.4,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 34,
                                    child: Text(
                                      '* 핸드폰 번호',
                                      style: TextStyle(
                                        fontSize: 28,
                                        letterSpacing: -1.4,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //핸드폰번호 입력창
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 90,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey)),
                            //border: Border.all(color: Colors.black),
                          ),
                          child: TextFormField(
                            onChanged: (value){
                              if(value.isNotEmpty){
                                setState(() {
                                  addressShow=true;
                                  addressShow3=false;
                                });
                              }
                              else{
                                setState(() {
                                  addressShow=false;
                                  addressShow3=true;
                                });
                              }
                            },
                            controller: addressController,
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: -1.4,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 34,
                                    child: Text(
                                      '* 주소',
                                      style: TextStyle(
                                        fontSize: 28,
                                        letterSpacing: -1.4,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              suffixIcon: addressShow3 ?
                              GestureDetector(
                                onTap: (){
                                  print("onTap of 검색하기");
                                  AddressFind();
                                },
                                child: Container(
                                  width: 200,
                                  height: 70,
                                  alignment: Alignment.center,
                                  color: Colors.grey[200],
                                  child: Text('검색하기',
                                    style: TextStyle(
                                      fontSize: 26,
                                      letterSpacing: -1.3,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                              ) : null,
                            ),
                          ),
                        ),
                        //주소 첫번째 입력창
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 90,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey)),
                            //border: Border.all(color: Colors.black),
                          ),
                          child: TextFormField(
                            onChanged: (value){
                              if(value.isNotEmpty){
                                setState(() {
                                  addressShow2=true;
                                });
                              }
                              else{
                                setState(() {
                                  addressShow2=false;
                                });
                              }
                            },
                            controller: addressController2,
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: -1.4,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 34,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //주소 두번째 입력창
                      ],
                    ),
                    //연락처 항목
                    SizedBox(
                      height: 80,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '신체정보',
                              style: TextStyle(
                                fontSize: 30,
                                letterSpacing: -1.5,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '* 필수',
                              style: TextStyle(
                                fontSize: 24,
                                letterSpacing: -1.2,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        //신체정보 문구
                        SizedBox(
                          height: 21,
                        ),
                        Container(
                          width: 562,
                          height: 2,
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                        //밑줄
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 90,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey)),
                            //border: Border.all(color: Colors.black),
                          ),
                          child: TextFormField(
                            onChanged: (value){
                              /*if(value.isNotEmpty){
                                setState(() {
                                  sexShow=true;
                                });
                              }
                              else{
                                setState(() {
                                  sexShow=false;
                                });
                              }*/
                            },
                            onTap: (){SexFind();},
                            controller: sexController,
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: -1.4,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // 접두어 텍스트
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 34,
                                    child: Text(
                                      //isMale?"남자":"여자",
                                      '* 성별',
                                      style: TextStyle(
                                        fontSize: 28,
                                        letterSpacing: -1.4,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  SexFind();
                                },
                                icon: Icon(Icons.check, color: Colors.black,size: 28,),
                              ),
                            ),
                          ),
                        ),
                        //성별 입력창
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 90,
                              width: 272,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                Border(bottom: BorderSide(color: Colors.grey)),
                                //border: Border.all(color: Colors.black),
                              ),
                              child: TextFormField(
                                onChanged: (value){
                                  /* if(value.isNotEmpty){
                                    setState(() {
                                      heightShow=true;
                                    });
                                  }
                                  else{
                                    setState(() {
                                      heightShow=false;
                                    });
                                  }*/
                                },
                                onTap: (){HeightFind();},
                                controller: heightController,
                                style: TextStyle(
                                  fontSize: 28,
                                  letterSpacing: -1.4,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 34,
                                        child: Text(
                                          '* 신장',
                                          style: TextStyle(
                                            fontSize: 28,
                                            letterSpacing: -1.4,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      HeightFind();
                                    },
                                    icon: Icon(Icons.check, color: Colors.black,size: 28,),
                                  ),
                                ),
                              ),
                            ),
                            //신장 입력창
                            SizedBox(
                              width: 18,
                            ),
                            Container(
                              height: 90,
                              width: 272,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                Border(bottom: BorderSide(color: Colors.grey)),
                                //border: Border.all(color: Colors.black),
                              ),
                              child: TextFormField(
                                onChanged: (value){
                                  /*if(value.isNotEmpty){
                                    setState(() {
                                      weightShow=true;
                                    });
                                  }
                                  else{
                                    setState(() {
                                      weightShow=false;
                                    });
                                  }*/
                                },
                                onTap: (){HeightFind();},
                                controller: weightController,
                                style: TextStyle(
                                  fontSize: 28,
                                  letterSpacing: -1.4,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 34,
                                        child: Text(
                                          '* 체중',
                                          style: TextStyle(
                                            fontSize: 28,
                                            letterSpacing: -1.4,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: (){HeightFind();},
                                    icon: Icon(Icons.check, color: Colors.black,size: 28,),
                                  ),
                                ),
                              ),
                            ),
                            //몸무게 입력창
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 90,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey)),
                            //border: Border.all(color: Colors.black),
                          ),
                          child: TextFormField(
                            onChanged: (value){
                              /*if(value.isNotEmpty){
                                setState(() {
                                  birthdayShow=true;
                                });
                              }
                              else{
                                setState(() {
                                  birthdayShow=false;
                                });
                              }*/
                            },
                            onTap: (){BirthdayFind();},
                            controller: birthdayController,
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: -1.4,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // 접두어 텍스트
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 34,
                                    child: Text(
                                      '* 생년월일',
                                      style: TextStyle(
                                        fontSize: 28,
                                        letterSpacing: -1.4,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              suffixIcon: IconButton(
                                onPressed: (){BirthdayFind();},
                                icon: Icon(Icons.check, color: Colors.black,size: 28,),
                              ),
                            ),
                          ),
                        ),
                        //생년월일 입력창
                      ],
                    ),
                    //신체정보 항목
                    SizedBox(
                      height: 80,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '운동선호도(선택)',
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: -1.5,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                          ),
                        ),
                        // 문구
                        SizedBox(
                          height: 21,
                        ),
                        Container(
                          width: 562,
                          height: 2,
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                        //밑줄
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 90,
                              width: 272,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                Border(bottom: BorderSide(color: Colors.grey)),
                                //border: Border.all(color: Colors.black),
                              ),
                              child: TextFormField(
                                controller: eventController,
                                style: TextStyle(
                                  fontSize: 28,
                                  letterSpacing: -1.4,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 34,
                                        child: Text(
                                          '* 종목',
                                          style: TextStyle(
                                            fontSize: 28,
                                            letterSpacing: -1.4,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.check, color: Colors.black,size: 28,),
                                  ),
                                ),
                              ),
                            ),
                            //종목 입력창
                            SizedBox(
                              width: 18,
                            ),
                            Container(
                              height: 90,
                              width: 272,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                Border(bottom: BorderSide(color: Colors.grey)),
                                //border: Border.all(color: Colors.black),
                              ),
                              child: TextFormField(
                                controller: careerController,
                                style: TextStyle(
                                  fontSize: 28,
                                  letterSpacing: -1.4,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 34,
                                        child: Text(
                                          '* 경력',
                                          style: TextStyle(
                                            fontSize: 28,
                                            letterSpacing: -1.4,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.check, color: Colors.black,size: 28,),
                                  ),
                                ),
                              ),
                            ),
                            //경력 입력창
                          ],
                        ),
                        Container(
                          width: 562,
                          height: 200,
                          child: AnimatedList(
                            key: _key,
                            initialItemCount: 0,
                            itemBuilder: (context, index, animation) {
                              return SizeTransition(
                                sizeFactor: animation,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 272,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                        Border(bottom: BorderSide(color: Colors.grey)),
                                        //border: Border.all(color: Colors.black),
                                      ),
                                      child: TextFormField(
                                        controller: eventController,
                                        style: TextStyle(
                                          fontSize: 28,
                                          letterSpacing: -1.4,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 150,
                                                height: 34,
                                                child: Text(
                                                  '* 종목',
                                                  style: TextStyle(
                                                    fontSize: 28,
                                                    letterSpacing: -1.4,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: (){},
                                            icon: Icon(Icons.check, color: Colors.black,size: 28,),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //종목 입력창
                                    SizedBox(
                                      width: 18,
                                    ),
                                    Container(
                                      height: 90,
                                      width: 272,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                        Border(bottom: BorderSide(color: Colors.grey)),
                                        //border: Border.all(color: Colors.black),
                                      ),
                                      child: TextFormField(
                                        controller: careerController,
                                        style: TextStyle(
                                          fontSize: 28,
                                          letterSpacing: -1.4,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 150,
                                                height: 34,
                                                child: Text(
                                                  '* 경력',
                                                  style: TextStyle(
                                                    fontSize: 28,
                                                    letterSpacing: -1.4,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: (){},
                                            icon: Icon(Icons.check, color: Colors.black,size: 28,),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //경력 입력창
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    //운동선호도 항목
                    SizedBox(
                      height: 30,
                    ),
                    IconButton(
                      alignment: Alignment.center,
                      onPressed: () => _addItem(),
                      icon: Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 90,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 90,
                    width: 562,
                    decoration: BoxDecoration(
                        color: emailShow && callShow && addressShow && addressShow2 &&
                            sexShow && heightShow && weightShow && birthdayShow
                            ? Colors.yellow[600] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(45)),
                    child: Center(
                      child: Text('완료',
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
                //완료버튼
              ],
            ),
          ),
        ),
      ),
    );
  }
}
