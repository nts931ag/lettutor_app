// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/presentation/widgets/authentication/input_field_area_widget.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              AppLocalizations.of(context)!.forgot_password_title,
              style: text28.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              AppLocalizations.of(context)!.forgot_password_sub_title,
              style: text14,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            InputFieldArea()
          ],
        ),
      ),
    );
  }
}
