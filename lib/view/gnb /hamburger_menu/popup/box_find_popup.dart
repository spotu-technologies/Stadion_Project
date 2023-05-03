import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxPopup extends StatefulWidget {
  const BoxPopup({Key? key, required this.applyPassAtSub, required this.applyBoxAtSub}) : super(key: key);

  final Function(String) applyPassAtSub;
  final Function(String) applyBoxAtSub;

  @override
  State<BoxPopup> createState() => _BoxPopupState();
}

class _BoxPopupState extends State<BoxPopup> {

  List<String> passSelectedList = ['사용가능', '만료'];
  List<String> boxSelectedList = ['PG', 'GM', 'BG', 'SJ', 'SS'];
  int _selectedPass = 0;
  int _selectedBox = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[300],
      //alignment: Alignment.topCenter,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: IconButton(
        alignment: Alignment.topRight,
        onPressed: ()=>Get.back(),
        icon: Icon(Icons.close,
          size: 50,
        ),
      ),
      content: Stack(
        children: [
          Positioned(
            child: Container(
              width: 662,
              height: 864,
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('PASS',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 186),
                      Container(
                        width: 276,
                        height: 2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors:[Color(0x00ffffff), Color(0xff848484), Color(0x00ffffff)],
                          ),
                        ),
                      ),
                      SizedBox(height: 142),
                      Container(
                        width: 276,
                        height: 2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            //begin: Alignment(0,0.5),
                            //end: Alignment(1,0.5),
                            colors:[Color(0x00ffffff), Color(0xff848484), Color(0x00ffffff)],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('BOX',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 186),
                      Container(
                        width: 276,
                        height: 2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors:[Color(0x00ffffff), Color(0xff848484), Color(0x00ffffff)],
                          ),
                        ),
                      ),
                      SizedBox(height: 142),
                      Container(
                        width: 276,
                        height: 2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            //begin: Alignment(0,0.5),
                            //end: Alignment(1,0.5),
                            colors:[Color(0x00ffffff), Color(0xff848484), Color(0x00ffffff)],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //백그라운드
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 650,
                  width: 276,
                  //margin: EdgeInsets.symmetric(horizontal: 175),
                  child: CupertinoPicker(
                    backgroundColor: Colors.transparent,
                    magnification: 2,
                    squeeze: 0.5,
                    useMagnifier: true,
                    itemExtent: 50,
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedPass = selectedItem;
                      });
                    },
                    children: List<Widget>.generate(passSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          passSelectedList[index],
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Container(
                  height: 650,
                  width: 276,
                  //margin: EdgeInsets.symmetric(horizontal: 175),
                  child: CupertinoPicker(
                    backgroundColor: Colors.transparent,
                    magnification: 2,
                    squeeze: 0.5,
                    useMagnifier: true,
                    itemExtent: 50,
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedBox = selectedItem;
                      });
                    },
                    children: List<Widget>.generate(boxSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          boxSelectedList[index],
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          //picker
          Positioned(
            top: 685,
            left: 50,
            right: 50,
            child: GestureDetector(
              onTap: () {
                print("onTap Save: selected= $_selectedPass");

                widget.applyPassAtSub(passSelectedList[_selectedPass]);
                widget.applyBoxAtSub(boxSelectedList[_selectedBox]);

                Get.back();
              },
              child: Container(
                height: 90,
                width: 562,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45)),
                child: Center(
                  child: Text('선택하기',
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
          ),
          //저장버튼
        ],
      ),
    );
  }
}
