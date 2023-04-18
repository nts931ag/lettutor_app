import 'package:flutter/material.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginTitleArea extends StatelessWidget {
  const LoginTitleArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0.w),
          child: Text(
            AppLocalizations.of(context)!.login_title,
            style: text28.copyWith(
                color: const Color.fromRGBO(0, 113, 240, 1),
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          AppLocalizations.of(context)!.login_sub_title,
          style: text16.copyWith(
              color: const Color.fromRGBO(42, 52, 83, 1),
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
