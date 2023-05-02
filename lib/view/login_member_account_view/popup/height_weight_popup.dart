import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker_view/picker_view.dart';
import 'package:get/get.dart';

class HeightFindPopup extends StatefulWidget {
  const HeightFindPopup({Key? key, required this.applyHeightAtSub, required this.applyWeightAtSub}) : super(key: key);

  final Function(String) applyHeightAtSub;
  final Function(String) applyWeightAtSub;
  @override
  State<HeightFindPopup> createState() => _HeightFindPopupState();
}

class _HeightFindPopupState extends State<HeightFindPopup> {

  final List<int> HeightSelectedList = List.generate(250, (index) => index+1);
  final List<int> WeightSelectedList = List.generate(200, (index) => index+1);
  FixedExtentScrollController heightController = FixedExtentScrollController(initialItem: 180);
  FixedExtentScrollController WeightController = FixedExtentScrollController(initialItem: 70);
  int _selectedHeight = 0;
  int _selectedWeight = 0;

  //heightController.initialItem = 180;

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
              height: 950,
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('신장(cm)',
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: -1.5,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 230),
                          Container(
                            width: 280,
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
                            width: 280,
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
                          Text('체중(kg)',
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: -1.5,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 230),
                          Container(
                            width: 280,
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
                            width: 280,
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
                  height: 745,
                  width: 276,
                  //margin: EdgeInsets.symmetric(horizontal: 175),
                  child: CupertinoPicker(
                    scrollController: heightController,
                    backgroundColor: Colors.transparent,
                    magnification: 2,
                    squeeze: 0.5,
                    useMagnifier: true,
                    itemExtent: 50,
                    looping: true,
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedHeight = selectedItem+1;
                      });
                    },
                    children: List<Widget>.generate(HeightSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          HeightSelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      );
                    }),
                 ),
           ),
                Container(
                  height: 745,
                  width: 276,
                  //margin: EdgeInsets.symmetric(horizontal: 175),
                  child: CupertinoPicker(
                    scrollController: WeightController,
                    backgroundColor: Colors.transparent,
                    magnification: 2,
                    squeeze: 0.5,
                    useMagnifier: true,
                    itemExtent: 50,
                    looping: true,
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedWeight = selectedItem+1;
                      });
                    },
                    children: List<Widget>.generate(WeightSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          WeightSelectedList[index].toString(),
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
              top: 773,
              left: 30,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  print("onTap Save: selected= $_selectedHeight");
                  print("onTap Save: selected= $_selectedWeight");
                  //widget.applyHeightAtSub(_selectedHeight[i] = state);
                  if(_selectedHeight==0) {
                    widget.applyHeightAtSub(_selectedHeight.toString());
                    widget.applyWeightAtSub(_selectedWeight.toString());
                  }
                  else {
                    widget.applyHeightAtSub(_selectedHeight.toString());
                    widget.applyWeightAtSub(_selectedWeight.toString());
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