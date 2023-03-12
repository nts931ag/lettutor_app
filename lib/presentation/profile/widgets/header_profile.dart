import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/profile/widgets/logo_profile.dart';
import 'package:lettutor_app/res/colors/colors_core.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Center(
          child: LogoProfile(),
        ),
        Text(
          'Thai Son',
          style: text24.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        Text(
          '${LocalString.profileAccountID} f569c202-7bbf-0903-bg77-ecc1419a6b28',
          style: text14.copyWith(color: greyColor),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            LocalString.profileOtherReviews,
            style: text14.copyWith(color: primaryColor),
          ),
        ),
      ]),
    );
  }
}

