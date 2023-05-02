import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker_view/picker_view.dart';
import 'package:get/get.dart';

class BirthdayFindPopup extends StatefulWidget {
  const BirthdayFindPopup({Key? key, required this.applyBirthdayAtSub}) : super(key: key);

  final Function(String, String, String) applyBirthdayAtSub;

  @override
  State<BirthdayFindPopup> createState() => _BirthdayFindPopupState();
}

class _BirthdayFindPopupState extends State<BirthdayFindPopup> {

  final List<int> YearSelectedList = List.generate(200, (index) => index+1900);
  final List<int> MonthSelectedList = List.generate(12, (index) => index+1);
  final List<int> DaySelectedList = List.generate(31, (index) => index+1);
  FixedExtentScrollController YearController = FixedExtentScrollController(initialItem: 123);
  FixedExtentScrollController MonthController = FixedExtentScrollController(initialItem: 7);
  FixedExtentScrollController DayController = FixedExtentScrollController(initialItem: 15);
  int _selectedYear = 0;
  int _selectedMonth = 0;
  int _selectedDay = 0;

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
              height: 1016,
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: Column(
                children: [
                  Text('생년월일',
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: -1.5,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Y',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 230),
                          Container(
                            width: 180,
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
                            width: 180,
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
                          Text('M',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 230),
                          Container(
                            width: 180,
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
                            width: 180,
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
                          Text('D',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 230),
                          Container(
                            width: 180,
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
                            width: 180,
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
                  height: 920,
                  width: 180,
                  //margin: EdgeInsets.symmetric(horizontal: 175),
                  child: CupertinoPicker(
                    scrollController: YearController,
                    backgroundColor: Colors.transparent,
                    magnification: 2,
                    squeeze: 0.5,
                    useMagnifier: true,
                    itemExtent: 50,
                    looping: true,
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedYear = selectedItem+1900;
                      });
                    },
                    children: List<Widget>.generate(YearSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          YearSelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Container(
                  height: 890,
                  width: 180,
                  //margin: EdgeInsets.symmetric(horizontal: 175),
                  child: CupertinoPicker(
                    scrollController: MonthController,
                    backgroundColor: Colors.transparent,
                    magnification: 2,
                    squeeze: 0.5,
                    useMagnifier: true,
                    itemExtent: 50,
                    looping: true,
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedMonth = selectedItem+1;
                      });
                    },
                    children: List<Widget>.generate(MonthSelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          MonthSelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Container(
                  height: 890,
                  width: 180,
                  //margin: EdgeInsets.symmetric(horizontal: 175),
                  child: CupertinoPicker(
                    scrollController: DayController,
                    backgroundColor: Colors.transparent,
                    magnification: 2,
                    squeeze: 0.5,
                    useMagnifier: true,
                    itemExtent: 50,
                    looping: true,
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedDay = selectedItem+1;
                      });
                    },
                    children: List<Widget>.generate(DaySelectedList.length, (int index) {
                      return Center(
                        child: Text(
                          DaySelectedList[index].toString(),
                          style: TextStyle(
                            fontSize: 25,
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
            top: 839,
            left: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                print("onTap Save: selected= $_selectedYear");
                print("onTap Save: selected= $_selectedMonth");
                print("onTap Save: selected= $_selectedDay");
                //widget.applyHeightAtSub(_selectedHeight[i] = state);
                if(_selectedYear==0) {
                  widget.applyBirthdayAtSub(
                      _selectedYear.toString(), _selectedMonth.toString(), _selectedDay.toString());

                }
                else {
                  widget.applyBirthdayAtSub(
                      _selectedYear.toString(), _selectedMonth.toString(), _selectedDay.toString());


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