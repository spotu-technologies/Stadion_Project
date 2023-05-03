import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'popup/movement_guide_popup.dart';

class MovementGuideView extends StatefulWidget {
  const MovementGuideView({Key? key}) : super(key: key);

  @override
  State<MovementGuideView> createState() => _MovementGuideViewState();
}

class _MovementGuideViewState extends State<MovementGuideView> {

  var guideController = TextEditingController();

  String isGuide = '';

  void GuideFind() {
    Get.dialog(
      MovementGuidePopup(applyGuideAtSub: applyGuide),
    );
  }

  void applyGuide(String value) {
    isGuide = value;
    guideController.text = '${isGuide}';
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
            shape: Border(bottom: BorderSide(color: Colors.black)),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('MOVEMENT GUIDE',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 32,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 44),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 86,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                    Border(bottom: BorderSide(color: Colors.black)),
                    //border: Border.all(color: Colors.black),
                  ),
                  child: TextFormField(
                    onChanged: (value){},
                    onTap: (){GuideFind();},
                    controller: guideController,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'CATEGORY',
                      suffixIcon: IconButton(
                        onPressed: (){
                          GuideFind();
                        },
                        icon: Icon(Icons.check, color: Colors.black,size: 28,),
                      ),
                    ),
                  ),
                ),
                ///선택창
              ],
            ),
          ),
        ),
      ),
    );
  }
}
