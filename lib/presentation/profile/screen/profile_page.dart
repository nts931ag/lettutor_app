// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/profile/screen/profile_controller.dart';
import 'package:lettutor_app/presentation/profile/widgets/header_profile.dart';
import 'package:lettutor_app/presentation/profile/widgets/profile_field.dart';
import 'package:lettutor_app/res/colors/colors_core.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/colors.gen.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class ProfilePage extends BaseScreen<ProfileController> {
  @override
  Widget buildContentView(BuildContext context) {
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
                LocalString.account,
                style: text14,
              ),
            ),
            ProfileField(
              controller: controller,
            )
          ],
        ),
      ),
    );
  }
}

