// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/text_field/input_field_profile_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(AppLocalizations.of(context)!.change_password_new,
              style: text16.copyWith(fontWeight: FontWeight.w700)),
          SizedBox(
            height: 25.h,
          ),
          InputFieldProfile(
            isImportant: true,
            title: AppLocalizations.of(context)!.password_title,
            child: baseTextField(
                onChanged: (value) {}, controller: null, hintText: ''),
          ),
          SizedBox(
            height: 25.h,
          ),
          InputFieldProfile(
            isImportant: true,
            title: AppLocalizations.of(context)!.change_password_new,
            child: baseTextField(
                onChanged: (value) {}, controller: null, hintText: ''),
          ),
          SizedBox(
            height: 25.h,
          ),
          InputFieldProfile(
            isImportant: true,
            title: AppLocalizations.of(context)!.change_password_confirm,
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
                  label: AppLocalizations.of(context)!.change_password_confirm,),
            ),
          )
        ],
      ),
    );
  }
}