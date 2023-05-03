import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadgeView extends StatefulWidget {
  const BadgeView({Key? key}) : super(key: key);

  @override
  State<BadgeView> createState() => _BadgeViewState();
}

class _BadgeViewState extends State<BadgeView> {

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
            title: Text('BADGE',
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 44),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 662,
                  height: 108,
                  child: Text('운동 목표를 완수하여                        배지를 획득하세요!',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: -2.4,
                    ),
                  ),
                ),
                ///문구

              ],
            ),
          ),
        ),
      ),
    );
  }
}
