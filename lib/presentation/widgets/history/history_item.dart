import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/domain/models/Schedule.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/items/item_widget.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:lettutor_app/utils/utils.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return ItemWidget(
        avatar: Image.network(
          schedule.scheduleDetailInfo.scheduleInfo.tutorInfo.avatar,
          errorBuilder: (context, exception, stackTrace) {
            return Assets.images.img.image(fit: BoxFit.cover);
          },
        ),
        nation: schedule.scheduleDetailInfo.scheduleInfo.tutorInfo.country,
        date: formatDayOfWeekAndDateFromTimestamp(
            schedule.scheduleDetailInfo.startPeriodTimestamp),
        imgNation: Assets.svg.common.iconUs.svg(height: 22.w, width: 22.w),
        isDisableButton: true,
        name: schedule.scheduleDetailInfo.scheduleInfo.tutorInfo.name,
        subTime:
            '${formatMinusFrom2Timestamp(schedule.scheduleDetailInfo.startPeriodTimestamp, schedule.scheduleDetailInfo.endPeriodTimestamp)} Minutes',
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.history_lesson_time,
                    style: text18,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: LoadingButtonWidget(
                      height: 25.w,
                      submit: () {},
                      isLoading: false,
                      label: AppLocalizations.of(context)!.record,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: Get.width - 40.w,
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              child: Text(
                schedule.studentRequest ?? AppLocalizations.of(context)!.history_no_request,
                style: text14.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: Get.width - 40.w,
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              child: Text(
                schedule.tutorReview ?? AppLocalizations.of(context)!.history_tutor_rv,
                style: text14.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
                width: Get.width - 40.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.add_rating,
                      style: text14.copyWith(color: primaryColor),
                    ),
                    Text(
                      AppLocalizations.of(context)!.report,
                      style: text14.copyWith(color: primaryColor),
                    ),
                  ],
                )),
          ],
        ));
  }
}
