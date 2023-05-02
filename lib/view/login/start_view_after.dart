import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_login_view.dart';

class StartViewAfter extends StatefulWidget {
  const StartViewAfter({Key? key}) : super(key: key);

  @override
  State<StartViewAfter> createState() => _StartViewAfterState();
}

class _StartViewAfterState extends State<StartViewAfter> {

  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 500),
          () => Get.to(() => MainLoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 174,
              height: 185,
              margin: EdgeInsets.only(left: 210),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/TURN  ON  YOUR  ENERGY.png'),
                  )
              ),
            ),
            SizedBox(height: 55),
            Stack(
              children: [
                Center(
                  child: Container(
                    width: 148,
                    height: 76,
                    decoration: BoxDecoration(
                        color: Color(0xff28292c),
                        borderRadius: BorderRadius.circular(38)
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      margin: EdgeInsets.only(left: 6, top: 6, right: 6),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(32)
                      ),
                    ),
                    Container(
                      width: 64,
                      height: 64,
                      margin: EdgeInsets.only(left: 6, top: 6, right: 6),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(32)
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 14),
            Container(
              width: 148,
              height: 101,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('F',
                        style: TextStyle(
                          fontSize:40,
                          color: Color(0xff28292c),
                        ),
                      ),
                      Text('F',
                        style: TextStyle(
                          fontSize:40,
                          color: Color(0xff28292c),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('N',
                        style: TextStyle(
                          fontSize:40,
                          color: Colors.yellow,
                        ),
                      ),
                      Text('',
                        style: TextStyle(
                          fontSize:40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
