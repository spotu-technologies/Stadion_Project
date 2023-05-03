import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'popup/box_find_popup.dart';

class PassView extends StatefulWidget {
  const PassView({Key? key}) : super(key: key);

  @override
  State<PassView> createState() => _PassViewState();
}

class _PassViewState extends State<PassView> {

  int _selectedIndex = 0; ///BottomNavigationBar

  var passController = TextEditingController();
  var boxController = TextEditingController();

  String isPass = '';
  String isBox = '';

  void BoxPassFind() {
    Get.dialog(
      BoxPopup(applyPassAtSub: applyPass, applyBoxAtSub: applyBox),
    );
  }


  void applyPass(String value) {
    isPass = value;
    passController.text = '${isPass}';
    setState(() {
    });
  }

  void applyBox(String value) {
    isBox = value;
    boxController.text = '${isBox}';
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Padding(
          padding: EdgeInsets.only(left: 44, top: 105, right: 44),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('BOX PASS',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 50,
            ),
            actions: [
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.search,
                  size: 50,
                ),
                color: Colors.black,
              ),
              SizedBox(width: 18),
              Image(
                image: AssetImage('assets/images/그룹 9023.png'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: SizedBox(
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 662,
                height: 2,
                color: Colors.black,
              ),
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black,
                selectedFontSize: 22,
                unselectedFontSize: 22,
                currentIndex: _selectedIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/home.png'),
                      size: 50,
                      color: Colors.black,
                    ),
                    label: 'HOME',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/mom level.png'),
                      size: 50,
                      color: Colors.black,
                    ),
                    label: 'MoM LEVEL',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/mtc.png'),
                      size: 50,
                      color: Colors.black,
                    ),
                    label: 'Mtc',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/numbers.png'),
                      size: 50,
                      color: Colors.black,
                    ),
                    label: 'NUMBERS',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/wod.png'),
                      size: 50,
                      color: Colors.black,
                    ),
                    label: 'WoD',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 44),
          child: SingleChildScrollView(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 322,
                      height: 1,
                      color: Colors.black,
                    ),
                    Container(
                      height: 87,
                      width: 322,
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        onChanged: (value){},
                        onTap: (){BoxPassFind();},
                        controller: passController,
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: -1.4,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'PASS',
                          suffixIcon: IconButton(
                            onPressed: (){
                              BoxPassFind();
                            },
                            icon: Icon(Icons.check, color: Colors.black,size: 28,),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 322,
                      height: 1,
                      color: Colors.black,
                    ),
                  ],
                ),
                //신장 입력창
                SizedBox(
                  width: 18,
                ),
                Column(
                  children: [
                    Container(
                      width: 322,
                      height: 1,
                      color: Colors.black,
                    ),
                    Container(
                      height: 87,
                      width: 322,
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        onChanged: (value){},
                        onTap: (){BoxPassFind();},
                        controller: boxController,
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: -1.4,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'BOX',
                          suffixIcon: IconButton(
                            onPressed: (){
                              BoxPassFind();
                            },
                            icon: Icon(Icons.check, color: Colors.black,size: 28,),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 322,
                      height: 1,
                      color: Colors.black,
                    ),
                  ],
                ),
                //몸무게 입력창
              ],
            ),
          ),
        ),
      ),
    );
  }
}
