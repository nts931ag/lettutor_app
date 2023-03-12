import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/app/app_pages.dart';
import 'package:lettutor_app/presentation/common/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/presentation/login/screen/login_controller.dart';
import 'package:lettutor_app/res/colors/colors_core.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class InputFieldArea extends StatelessWidget {
  late LoginController loginController;
  InputFieldArea({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Text(
          LocalString.emailTitle,
          style: text14.copyWith(color: greyColor),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 8.h,
        ),
        baseTextField(
            onChanged: (value) {},
            controller: null,
            hintText: 'email@example.com'),
        SizedBox(
          height: 15.h,
        ),
        Text(
          LocalString.passwordTitle,
          style: text14.copyWith(color: greyColor),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 8.h,
        ),
        baseTextField(
            onChanged: (value) {},
            controller: null,
            hintText: '',
            icon: InkWell(
              onTap: () {},
              child: const Icon(Icons.visibility, size: 20),
            )),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.FORGOT_PASSWORD);
          },
          child: Text(
            LocalString.forgetPassword,
            style:
            text14.copyWith(color: const Color.fromRGBO(40, 106, 210, 1)),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Obx(
              () => LoadingButtonWidget(
              submit: () {
                Get.offNamed(AppRoutes.DASHBOARD);
              },
              isLoading: false,
              label: loginController.isLogin.value
                  ? LocalString.login
                  : LocalString.signUp),
        )
      ],
    );
  }
}