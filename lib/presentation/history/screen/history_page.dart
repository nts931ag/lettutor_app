// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/history/screen/history_controller.dart';
import 'package:lettutor_app/presentation/history/widgets/history_item.dart';
import 'package:lettutor_app/presentation/schedule/widgets/header_item.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';

class HistoryPage extends BaseScreen<HistoryController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderItem(
            img: Assets.svg.history.iconHistory.svg(height: 80.w, width: 80.w),
            lowerContent: LocalString.historyTitle,
            upperContent: LocalString.drawerHistory,
            lowerSubContent: LocalString.historySubTitle,
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
