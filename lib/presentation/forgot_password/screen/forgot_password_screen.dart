// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/forgot_password/screen/forgot_password_controller.dart';
import 'package:lettutor_app/presentation/forgot_password/widgets/input_field_widget.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class ForgotPasswordScreen extends BaseScreen<ForgotPasswordController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              LocalString.forgotPasswordTitle,
              style: text28.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              LocalString.forgotPasswordSubTitle,
              style: text14,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            const InputFieldArea()
          ],
        ),
      ),
    );
  }
}

