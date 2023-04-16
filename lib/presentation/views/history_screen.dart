// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/presentation/widgets/history/history_item.dart';
import 'package:lettutor_app/presentation/widgets/schedule/header_item.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderItem(
            img: Assets.svg.history.iconHistory.svg(height: 80.w, width: 80.w),
            lowerContent: AppLocalizations.of(context)!.history_title,
            upperContent: AppLocalizations.of(context)!.history_title,
            lowerSubContent: AppLocalizations.of(context)!.history_sub_title,
          ),
          SizedBox(
            height: 20.h,
          ),
          const HistoryItem(),
          SizedBox(
            height: 20.h,
          ),
          const HistoryItem(),
          SizedBox(
            height: 50.h,
          )
        ],
      ),
    );
  }
}
