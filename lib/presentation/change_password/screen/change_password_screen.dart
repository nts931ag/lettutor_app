// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/change_password/screen/change_password_controller.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/common/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/text_field/input_field_profile_widget.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class ChangePasswordScreen extends BaseScreen<ChangePasswordController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(LocalString.drawerChangePassword,
              style: text16.copyWith(fontWeight: FontWeight.w700)),
          SizedBox(
            height: 25.h,
          ),
          InputFieldProfile(
            isImportant: true,
            title: LocalString.passwordTitle,
            child: baseTextField(
                onChanged: (value) {}, controller: null, hintText: ''),
          ),
          SizedBox(
            height: 25.h,
          ),
          InputFieldProfile(
            isImportant: true,
            title: LocalString.changePasswordNew,
            child: baseTextField(
                onChanged: (value) {}, controller: null, hintText: ''),
          ),
          SizedBox(
            height: 25.h,
          ),
          InputFieldProfile(
            isImportant: true,
            title: LocalString.changePasswordConfirm,
            child: baseTextField(
                onChanged: (value) {}, controller: null, hintText: ''),
          ),
          SizedBox(
            height: 25.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: Get.width / 2 - 50.w,
              child: LoadingButtonWidget(
                  height: 35.h,
                  submit: () {},
                  isLoading: false,
                  label: LocalString.confirm),
            ),
          )
        ],
      ),
    );
  }
}
