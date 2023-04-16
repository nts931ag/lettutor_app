// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';

class HeaderSchedule extends StatelessWidget {
  const HeaderSchedule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Assets.svg.schedule.iconSchedule.svg(height: 80.w, width: 80.w),
        Text(
          AppLocalizations.of(context)!.schedule,
          style: text28.copyWith(fontWeight: FontWeight.w800),
        ),
        Row(
          children: [
            Container(
              width: 5.w,
              height: 100.h,
              color: Colors.grey.withOpacity(0.5),
            ),
            SizedBox(
              width: 3.w,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50.w,
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50.w,
                    child: Text(
                      AppLocalizations.of(context)!.schedule_title,
                      style: text16.copyWith(color: Colors.grey),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50.w,
                    child: Text(
                      AppLocalizations.of(context)!.schedule_sub_title,
                      style: text16.copyWith(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
