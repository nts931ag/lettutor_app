// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/authentication/widgets/input_field_area_widget.dart';
import 'package:lettutor_app/presentation/authentication/widgets/login_title_area_widget.dart';
import 'package:lettutor_app/presentation/authentication/widgets/sign_up_area_widget.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  // TODO: controller to login
                  // loginController: controller,
                ),
                SizedBox(
                  height: 25.h,
                ),
                SignUpArea(
                  // TODO: Controller to signup
                  // loginController: controller,
                )
              ],
            ),
          )
        ],
      ),
    );

  }
}
