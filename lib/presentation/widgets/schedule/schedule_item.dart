import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/config/router/router.dart';
import 'package:lettutor_app/domain/models/Schedule.dart';
import 'package:lettutor_app/presentation/cubits/schedule/schedule_list_cubit.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/dialogs/base_dialog/confirm_dialog.dart';
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
    Size size = MediaQuery.of(context).size;

    return ItemWidget(
      avatar: Image.network(
        schedule.scheduleDetailInfo.scheduleInfo.tutorInfo.avatar,
        errorBuilder: (context, exception, stackTrace) {
          return Assets.images.img.image(fit: BoxFit.cover);
        },
      ),
      nation: schedule.scheduleDetailInfo.scheduleInfo.tutorInfo.country,
      studentMeetingLink: schedule.studentMeetingLink,
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
                  '${formatHourAndMinuteFromTimestamp(schedule.scheduleDetailInfo.startPeriodTimestamp)} - ${formatHourAndMinuteFromTimestamp(schedule.scheduleDetailInfo.endPeriodTimestamp)}',
                  // '${schedule.scheduleDetailInfo.startPeriod} - ${schedule.scheduleDetailInfo.endPeriod}',
                  style: text16,
                ),
                SizedBox(
                  width: 80.w,
                  height: 30.h,
                  child: LoadingButtonWidget(
                    submit: () {
                      onPressedCancel(
                          context,
                          size,
                          schedule.scheduleDetailInfo.startPeriodTimestamp,
                          schedule.id,
                          BlocProvider.of<ScheduleListCubit>(context));
                    },
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
                      schedule.studentRequest ??
                          AppLocalizations.of(context)!
                              .schedule_request_content,
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

  void onPressedCancel(BuildContext context, Size size, int startTimestamp,
      String id, ScheduleListCubit scheduleListCubit) {
    if (isAllowedToCancel(
        DateTime.fromMillisecondsSinceEpoch(startTimestamp))) {
      final List<DropdownMenuItem<String>> cancelReasonList = [
        const DropdownMenuItem(
            value: 'Reschedule at another time',
            child: Text('Reschedule at another time')),
        const DropdownMenuItem(
            value: 'Busy at that time', child: Text('Busy at that time')),
        const DropdownMenuItem(
            value: 'Asked by the tutor', child: Text('Asked by the tutor')),
        const DropdownMenuItem(value: 'Other', child: Text('Other')),
      ];
      String? selectedValue = cancelReasonList.first.value;

      //Dialogs
      showDialog(
          context: context,
          builder: (BuildContext context) {
            int reasonId = 1;
            return ConfirmDialog(
              content: null,
              title: AppLocalizations.of(context)!.cancelLesson,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.doYouWantToCancel),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: DropdownButtonFormField(
                        items: cancelReasonList,
                        value: selectedValue,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onChanged: (String? value) {
                          reasonId = cancelReasonList.indexWhere(
                                  (element) => element.value == selectedValue) +
                              1;
                          /*setState(() {
                            selectedValue = value;
                          });*/
                        },
                      )),
                ],
              ),
              size: size,
              onRightButton: () {
                scheduleListCubit.cancelBookingByScheduleId(
                    scheduleId: id, reasonId: reasonId);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Cancel booking successfully!', style: text14,)),
                );
                Navigator.of(context).pop();
              },
              onLeftButton: () {
                Navigator.of(context).pop();
              },
              leftButton: AppLocalizations.of(context)!.cancel,
              rightButton: AppLocalizations.of(context)!.confirm,
              hasLeftButton: true,
            );
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Classes can only be canceled within 2 hours before starting.', style: text14,)),
      );
    }
  }

  bool isAllowedToCancel(DateTime lessonStart) {
    var timeToLesson = DateTime.now().difference(lessonStart);
    return timeToLesson.compareTo(const Duration(hours: 2)) < 0;
  }
}
