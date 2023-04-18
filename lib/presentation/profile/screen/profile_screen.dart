// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/profile/widgets/header_profile.dart';
import 'package:lettutor_app/presentation/profile/widgets/profile_field.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/colors.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
            border: Border.all(color: ColorName.greyColor, width: 2.0)),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 5.0,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0.r),
                    topRight: Radius.circular(5.0.r),
                  )),
            ),
            SizedBox(height: 35.h),
            const HeaderProfile(),
            SizedBox(height: 35.h),
            Container(
              height: 46.h,
              color: ColorName.greyColor,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(12.0.w),
              child: Text(
                AppLocalizations.of(context)!.account,
                style: text14,
              ),
            ),
            ProfileField(
            )
          ],
        ),
      ),
    );
  }
}
