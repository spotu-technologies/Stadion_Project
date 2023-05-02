import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressFindPopup extends StatefulWidget {
  const AddressFindPopup({Key? key}) : super(key: key);

  @override
  State<AddressFindPopup> createState() => _AddressFindPopupState();
}

class _AddressFindPopupState extends State<AddressFindPopup> {

  var addressController = TextEditingController();
  var addressController2 = TextEditingController();
  var postController = TextEditingController();

  bool postShow = false;
  bool addressShow = false;
  bool addressShow2 = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[300],
      alignment: Alignment.topCenter,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: IconButton(
        //padding: EdgeInsets.only(top: 20, right: 20),
        alignment: Alignment.topRight,
        onPressed: ()=>Get.back(),
        icon: Icon(Icons.close,
          size: 50,
        ),
      ),
      content: Container(
        padding: EdgeInsets.only(left: 30, top: 30, right: 30),
        width: 662,
        height: 716,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text('주색검색',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: -1.5,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            ),
            //타이틀
            SizedBox(
              height: 64,
            ),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 340,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    //border:
                    //Border(bottom: BorderSide(color: Colors.grey)),
                    //border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextFormField(
                      onChanged: (value){
                        if(value.isNotEmpty){
                          setState(() {
                            postShow=true;
                          });
                        }
                        else{
                          setState(() {
                            postShow=false;
                          });
                        }
                      },
                      controller: postController,
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: -1.4,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '우편번호',
                      ),
                    ),
                  ),
                ),
                //우편번호 입력창
                SizedBox(
                  width: 21,
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: 200,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Text('우편번호 찾기',
                      style: TextStyle(
                        fontSize: 26,
                        letterSpacing: -1.3,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                //몸무게 입력창
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              height: 70,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                //border:
                //Border(bottom: BorderSide(color: Colors.grey)),
                //border: Border.all(color: Colors.black),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: TextFormField(
                  onChanged: (value){
                    if(value.isNotEmpty){
                      setState(() {
                        addressShow=true;
                      });
                    }
                    else{
                      setState(() {
                        addressShow=false;
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
                    hintText: '도로명주소',
                  ),
                ),
              ),
            ),
            //주소 첫번째 입력창
            SizedBox(
              height: 18,
            ),
            Container(
              height: 70,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                //border:
                //Border(bottom: BorderSide(color: Colors.grey)),
                //border: Border.all(color: Colors.black),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
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
                    hintText: '상세주소',
                  ),
                ),
              ),
            ),
            //주소 두번째 입력창
            SizedBox(
              height: 90,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 90,
                width: 562,
                decoration: BoxDecoration(
                    color: postShow && addressShow && addressShow2 ?
                    Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(45)),
                child: Center(
                  child: Text('저장하기',
                    style: TextStyle(
                      color: postShow && addressShow && addressShow2 ?
                             Colors.white : Colors.black,
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
    );
  }
}
