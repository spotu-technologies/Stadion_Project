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
class MembershipIdInputViewController extends GetxController {
  bool idShow = false;

  var idController = TextEditingController();

  void idInputField(bool idShow) {
    this.idShow = idShow;
    update();
  }
}

class MembershipIdInputView extends GetView<MembershipIdInputViewController> {
  const MembershipIdInputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //뷰에 종속될 Get X controller는 build부에 put을 통해 생성하여 뷰가 dispose될 때 같이 dispose될 수 있도록 함.
    //뷰에 상관없이 유지되어야할 controller는 해당방식처럼 하면 안됨
    Get.put(MembershipIdInputViewController());
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          //추가한 커스텀 앱 바 위젯 (추후 좀 더 파라미터나 세부 위젯 추가필요)
          CustomAppBar(
            title: '회원가입',
            isEnglishTitle: false,
            onLeadingSearch: (){},
            onLeadingImage: (){},
            onLeading: () {
              //off를 통해 view를 빠져나갈 시 기존 페이지를 dispose
              Get.off(const LoginMembershipAgreementView());
            },
          ),
          const SizedBox(height: 56),
          LoginTitle(
            text: '로그인에 사용할\n아이디를 입력해 주세요.',
          ),
          const SizedBox(height: 86),
          buildIdFindInputField(),
        ],
      ),
    );
  }

  ///이메일 입력창/로그인버튼
  Column buildIdFindInputField() {
    return Column(
      children: [
        GetBuilder<MembershipIdInputViewController>(builder: (context) {
          return Column(
            children: [
              LoginTextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    controller.idInputField(true);
                  } else {
                    controller.idInputField(false);
                  }
                },
                controller: controller.idController,
                obscureText: false,
                hintText: '아이디(이메일) 입력',
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
  }
}
