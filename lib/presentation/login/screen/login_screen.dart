// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/login/screen/login_controller.dart';
import 'package:lettutor_app/presentation/login/widgets/input_field_area_widget.dart';
import 'package:lettutor_app/presentation/login/widgets/login_title_area_widget.dart';
import 'package:lettutor_app/presentation/login/widgets/sign_up_area_widget.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';

class LoginScreen extends BaseScreen<LoginController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 35.h,
          ),
          Assets.images.imageLogin.image(),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 35.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginTitleArea(),
                SizedBox(
                  height: 15.h,
                ),
                InputFieldArea(
                  loginController: controller,
                ),
                SizedBox(
                  height: 25.h,
                ),
                SignUpArea(
                  loginController: controller,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
