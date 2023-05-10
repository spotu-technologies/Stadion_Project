import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadion_project/style_config/color_scheme.dart';
import 'package:stadion_project/view/custom_widget/custom_app_bar.dart';

import '../../style_config/text_theme.dart';
import '../custom_widget/buttons/button_with_rollover.dart';
import '../custom_widget/custom_login_text.dart';
import '../custom_widget/text_field/login_text_field.dart';
import 'membership_agreement_view.dart';
import 'membership_password_input_view.dart';

//로그인 뷰에서 사용될 Get X controller.
class MembershipInformationViewController extends GetxController {
  var emailController = TextEditingController();
  var callController = TextEditingController();
  var addressController = TextEditingController();
  var addressController2 = TextEditingController();
  var sexController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var birthdayController = TextEditingController();
  var eventController = TextEditingController();
  var careerController = TextEditingController();

  bool emailShow = false;
  bool callShow = false;
  bool addressShow = false;
  bool addressShow2 = false;
  bool addressShow3 = true;
  bool sexShow = false;
  bool heightShow = false;
  bool weightShow = false;
  bool birthdayShow = false;

  bool isMale = true;
  String isHeight = '';
  String isWeight = '';
  String isYear = '';
  String isMonth = '';
  String isDay = '';

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void applySex(bool value) {
    isMale = value;
    sexController.text = isMale?"남자":"여자";
    update();
  }

  void applyHeight(String value) {
    isHeight = value;
    heightController.text = '${isHeight} cm';
    update();
  }

  void applyWeight(String value) {
    isWeight = value;
    weightController.text = '${isWeight} kg';
    update();
  }

  void applyBirthday(String valueYear, String valueMonth, String valueDay) {
    isYear = valueYear;
    isMonth = valueMonth;
    isDay = valueDay;
    birthdayController.text = '${isYear}. ${isMonth}. ${isDay}';
    print("current sex: $isYear");
    update();
  }

  /*void AddressFind() {
    Get.dialog(
      AddressFindPopup(),
    );
  }
  void SexFind() {
    Get.dialog(
      SexFindPopup(applySexAtSub: applySex),
    );
  }

  void HeightFind() {
    Get.dialog(
      HeightFindPopup(applyHeightAtSub: applyHeight, applyWeightAtSub: applyWeight),
    );
  }

  void BirthdayFind() {
    Get.dialog(
        BirthdayFindPopup(
            applyBirthdayAtSub:applyBirthday)
    );*/
}

class MembershipInformationView extends GetView<MembershipInformationViewController> {
  const MembershipInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MembershipInformationViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          //추가한 커스텀 앱 바 위젯 (추후 좀 더 파라미터나 세부 위젯 추가필요)
          CustomAppBar(
            title: '회원가입',
            isEnglishTitle: true,
            onLeading: () {
              //off를 통해 view를 빠져나갈 시 기존 페이지를 dispose
              Get.off(const LoginMembershipAgreementView());
            },
          ),
          const SizedBox(height: 56),
          LoginTitle(
            text: '스타디온 앱에서 사용할\n추가 정보를 입력해 주세요.',
          ),
          const SizedBox(height: 86),
          //buildIdFindInputField(),
        ],
      ),
    );
  }

  /*///이메일 입력창/로그인버튼
  Column buildIdFindInputField() {
    return Column(
      children: [
        GetBuilder<MembershipInformationViewController>(builder: (context) {
          return Column(
            children: [
              LoginTextFormField(
                onChanged: (value) {
                },
                controller: controller.idController,
                obscureText: false,
                hintText: '아이디 입력',
                suffixIcon: controller.idShow
                    ? IconButton(
                        padding: EdgeInsets.only(right: 25),
                        onPressed: () {
                          controller.idController.clear();
                          controller.idInputField(false);
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.black,
                          size: 30,
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 890),
              ButtonWithRollover(
                onTap: () {
                  Get.to(const MembershipPasswordInputView());
                },
                backgroundColor: controller.idShow
                    ? colorScheme.primary
                    : colorScheme.onBackground,
                child: Center(
                  child: Text(
                    '다음',
                    style: textThemeKo.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: controller.idShow
                          ? colorScheme.shadow
                          : colorScheme.surfaceVariant,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }*/
}
