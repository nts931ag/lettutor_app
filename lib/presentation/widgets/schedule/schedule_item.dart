import 'package:flutter/material.dart';
import 'package:lettutor_app/config/router/router.dart';
import 'package:lettutor_app/domain/models/Schedule.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/items/item_widget.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/utils/utils.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
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
      date: formatDayOfWeekAndDateFromTimestamp(
          schedule.scheduleDetailInfo.startPeriodTimestamp),
      imgNation: Assets.svg.common.iconUs.svg(height: 22.w, width: 22.w),
      isDisableButton: false,
      name: schedule.scheduleDetailInfo.scheduleInfo.tutorInfo.name,
      subTime:
          '${formatMinusFrom2Timestamp(schedule.scheduleDetailInfo.startPeriodTimestamp, schedule.scheduleDetailInfo.endPeriodTimestamp)} Minutes',
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // '${formatHourAndMinuteFromTimestamp(schedule.scheduleDetailInfo.startPeriodTimestamp)} - ${formatHourAndMinuteFromTimestamp(schedule.scheduleDetailInfo.endPeriodTimestamp)}',
                  '${schedule.scheduleDetailInfo.startPeriod} - ${schedule.scheduleDetailInfo.endPeriod}',
                  style: text16,
                ),
                SizedBox(
                  width: 80.w,
                  height: 30.h,
                  child: LoadingButtonWidget(
                    submit: () {},
                    isLoading: false,
                    primaryColor: Colors.red,
                    label: AppLocalizations.of(context)!.cancel,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.expand_more,
                          size: 15.w,
                        ),
                        Text(
                          AppLocalizations.of(context)!.schedule_request,
                          style: text14,
                        ),
                        Text(
                          AppLocalizations.of(context)!.schedule_edit_request,
                          style: text14.copyWith(color: primaryColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.w),
                    child: Text(
                      schedule.studentRequest ?? AppLocalizations.of(context)!.schedule_request_content,
                      style: text14.copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
