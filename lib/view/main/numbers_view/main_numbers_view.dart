import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';

//로그인 뷰에서 사용될 Get X controller.
class MianNumbersViewController extends GetxController {}

class MianNumbersView extends GetView<MianNumbersViewController> {
  const MianNumbersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MianNumbersViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Center(
        child: Text('nimbers',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
