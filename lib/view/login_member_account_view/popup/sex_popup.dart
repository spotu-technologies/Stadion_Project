import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SexFindPopup extends StatefulWidget {
  const SexFindPopup({Key? key, required this.applySexAtSub}) : super(key: key);

  final Function(bool) applySexAtSub;
  @override
  State<SexFindPopup> createState() => _SexFindPopupState();
}

class _SexFindPopupState extends State<SexFindPopup> {

  List<String> sexSelectedList = ['남자', '여자'];
  int _selectedSex = 0;

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
      content: Stack(
        children: [
          Positioned(
            child: Container(
              width: 662,
              height: 750,
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: Column(
                children: [
                  Text('성별',
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: -1.5,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 130),
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
                  //SizedBox(height: 260),
                  /*GestureDetector(
                    onTap: () {
                      print("onTap Save: selected= $_selectedSex");
                      //widget.applySexAtSub(_selectedSex==0);
                      if(_selectedSex==0) {
                        widget.applySexAtSub(true);
                      }
                      else {
                        widget.applySexAtSub(false);
                      }
                      Get.back();
                    },
                    child: Container(
                      height: 90,
                      width: 562,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45)),
                      child: Center(
                        child: Text('저장하기',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
          //백그라운드
          Positioned(
              child: Container(
                height: 535,
                margin: EdgeInsets.symmetric(horizontal: 175),
                child: CupertinoPicker(
                  backgroundColor: Colors.transparent,
                  magnification: 2,
                  squeeze: 0.5,
                  useMagnifier: true,
                  itemExtent: 50,
                  onSelectedItemChanged: (int selectedItem) {
                    setState(() {
                      _selectedSex = selectedItem;
                    });
                  },
                  children: List<Widget>.generate(sexSelectedList.length, (int index) {
                    return Center(
                      child: Text(
                        sexSelectedList[index],
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
            top: 570,
            left: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                print("onTap Save: selected= $_selectedSex");
                //widget.applySexAtSub(_selectedSex==0);
                if(_selectedSex==0) {
                  widget.applySexAtSub(true);
                }
                else {
                  widget.applySexAtSub(false);
                }
                Get.back();
              },
              child: Container(
                height: 90,
                width: 562,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45)),
                child: Center(
                  child: Text('저장하기',
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

/*CupertinoPicker(
backgroundColor: Colors.transparent,
magnification: 2,
squeeze: 1,
useMagnifier: true,
itemExtent: 40,
onSelectedItemChanged: (int selectedItem) {
setState(() {
_selectedSex = selectedItem;
});
},
children: List<Widget>.generate(sexSelected.length, (int index) {
return Center(
child: Text(
sexSelected[index],
),
);
}),
),*/

/*Container(
padding: EdgeInsets.only(left: 30, top: 30, right: 30),
width: 662,
height: 750,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(12),
),
child: Column(
children: [
Text('성별',
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
height: 61,
),
Center(
child: Container(
height: 345,
width: 400,
color: Colors.grey[300],
child: Center(
child: CupertinoPicker(
itemExtent: 50,
magnification: 2,
onSelectedItemChanged: (int index) {
print(index);
},
children: [
Align(
alignment: Alignment.center,
child: Text(
'남자',
style: TextStyle(
color: Colors.black,
fontSize: 40,
),
),
),
Align(
alignment: Alignment.center,
child: Text(
'여자',
style: TextStyle(
color: Colors.black,
fontSize: 40,
),
),
),
],
),
),
),
),
/*SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      height: 48,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Text('',
                      style: TextStyle(
                        fontSize: 40,
                        letterSpacing: -2,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey[400],
                      ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: 400,
                      height: 143,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Text('남자',
                        style: TextStyle(
                          fontSize: 80,
                          letterSpacing: -2,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 400,
                      height: 48,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Text('여자',
                        style: TextStyle(
                          fontSize: 40,
                          letterSpacing: -2,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/
SizedBox(
height: 90,
),
GestureDetector(
onTap: () {},
child: Container(
height: 90,
width: 562,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(45)),
child: Center(
child: Text('저장하기',
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
),*/

/*import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SexFindPopup extends StatefulWidget {
  const SexFindPopup({Key? key}) : super(key: key);

  @override
  State<SexFindPopup> createState() => _SexFindPopupState();
}

class _SexFindPopupState extends State<SexFindPopup> {

  List<String> sexList = ['남자', '여자'];

  int _selectedFruit = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[300],
      alignment: Alignment.topCenter,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: IconButton(
        alignment: Alignment.topRight,
        onPressed: ()=>Get.back(),
        icon: Icon(Icons.close,
        size: 50,
        ),
      ),
      content: Container(
        padding: EdgeInsets.only(left: 30, top: 30, right: 30),
        width: 662,
        height: 750,
        child: Column(
          children: [
            Text('성별',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: -1.5,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            ),
            SizedBox(
              height: 155,
            ),
            CupertinoPicker(
                magnification: 2,
                squeeze: 1,
                useMagnifier: true,
                itemExtent: 50,
                onSelectedItemChanged: (int selectedItem){
                  setState(() {
                    _selectedFruit = selectedItem;
                  });
                },
                children:
                List<Widget>.generate(sexList.length, (int index) {
                  return Center(
                    child: Text(sexList[index]),
                  );
                },
                ),
            ),
          ],
        ),
      ),
    );
  }
}*/

