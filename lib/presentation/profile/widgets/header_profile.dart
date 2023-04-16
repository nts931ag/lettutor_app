import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/presentation/profile/widgets/logo_profile.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';

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
          '${AppLocalizations.of(context)!.profile_account_id} f569c202-7bbf-0903-bg77-ecc1419a6b28',
          style: text14.copyWith(color: greyColor),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context)!.profile_others_review,
            style: text14.copyWith(color: primaryColor),
          ),
        ),
      ]),
    );
  }
}
