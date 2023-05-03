import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqView extends StatefulWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {

  int _selectedIndex = 0; ///BottomNavigationBar

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
            title: Text('FAQ',
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
            child: Column(
              children: [
                Container(
                  width: 662,
                  height: 108,
                  child: Text('스타디온에 대해                                 궁금하세요?',
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
