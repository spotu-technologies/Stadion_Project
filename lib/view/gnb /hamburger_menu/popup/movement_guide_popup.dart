import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovementGuidePopup extends StatefulWidget {
  const MovementGuidePopup({Key? key, required this.applyGuideAtSub}) : super(key: key);

  final Function(String) applyGuideAtSub;
  @override
  State<MovementGuidePopup> createState() => _MovementGuidePopupState();
}

class _MovementGuidePopupState extends State<MovementGuidePopup> {

  List<String> guideSelectedList = ['ALL', 'AIR', 'FORCE', 'FLY'];
  int _selectedGuide = 0;

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
              child: Column(
                children: [
                  Text('CATEGORY',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 186),
                  Container(
                    width: 400,
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
                    width: 400,
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
            ),
          ),
          //백그라운드
          Positioned(
            child: Container(
              height: 650,
              margin: EdgeInsets.symmetric(horizontal: 175),
              child: CupertinoPicker(
                backgroundColor: Colors.transparent,
                magnification: 2,
                squeeze: 0.5,
                useMagnifier: true,
                itemExtent: 50,
                onSelectedItemChanged: (int selectedItem) {
                  setState(() {
                    _selectedGuide = selectedItem;
                  });
                },
                children: List<Widget>.generate(guideSelectedList.length, (int index) {
                  return Center(
                    child: Text(
                      guideSelectedList[index],
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          //picker
          Positioned(
            top: 685,
            left: 50,
            right: 50,
            child: GestureDetector(
              onTap: () {
                print("onTap Save: selected= $_selectedGuide");

                widget.applyGuideAtSub(guideSelectedList[_selectedGuide]);

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
