// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/schedule/screen/schedule_controller.dart';
import 'package:lettutor_app/presentation/schedule/widgets/header_item.dart';
import 'package:lettutor_app/presentation/schedule/widgets/schedule_item.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';

class ScheduleScreen extends BaseScreen<ScheduleController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderItem(
            img:
                Assets.svg.schedule.iconSchedule.svg(height: 80.w, width: 80.w),
            lowerContent: LocalString.scheduleTitle,
            upperContent: LocalString.schedule,
            lowerSubContent: LocalString.scheduleSubTitle,
          ),
          SizedBox(
            height: 20.h,
          ),
          const ScheduleItem(),
          SizedBox(
            height: 20.h,
          ),
          const ScheduleItem(),
          SizedBox(
            height: 50.h,
          )
        ],
      ),
    );
  }
}
