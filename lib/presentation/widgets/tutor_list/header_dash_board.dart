import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lettutor_app/config/router/router.dart';
import 'package:lettutor_app/config/router/router_arguments.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/locator.dart';
import 'package:lettutor_app/presentation/cubits/schedule/upcoming_schedule_cubit.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:lettutor_app/utils/utils.dart';

class HeaderDashboard extends StatelessWidget {
  const HeaderDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpcomingScheduleCubit(
        locator<ApiRepository>(),
      )..getUpcomingSchedule(),
      child: BlocBuilder<UpcomingScheduleCubit, UpcomingScheduleState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case UpcomingScheduleLoading:
              return const Center(child: CupertinoActivityIndicator());
            case UpcomingScheduleFailed:
              return const Center(child: Icon(Ionicons.refresh));
            case UpcomingScheduleSuccess:
              return Container(
                width: double.infinity,
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dash_board_up_coming,
                      style: text28.copyWith(
                          fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        state.upcomingSchedule != null
                            ? Text(
                                '${formatDayOfWeekAndDateFromTimestamp(state.upcomingSchedule!.scheduleDetailInfo.startPeriodTimestamp)} ${formatHourAndMinuteFromTimestamp(state.upcomingSchedule!.scheduleDetailInfo.startPeriodTimestamp)} - ${formatHourAndMinuteFromTimestamp(state.upcomingSchedule!.scheduleDetailInfo.endPeriodTimestamp)}',
                                textAlign: TextAlign.center,
                                style: text18.copyWith(color: whiteColor),
                              )
                            : Text(
                                AppLocalizations.of(context)!
                                    .dash_board_no_upcoming,
                                textAlign: TextAlign.center,
                                style: text18.copyWith(color: whiteColor),
                              )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "${AppLocalizations.of(context)!.dash_board_total_time}:\n"
                      "${formatTotalLessonHour(state.totalHours!)}",
                      textAlign: TextAlign.center,
                      style: text18.copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    if (state.upcomingSchedule != null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                        child: LoadingButtonWidget(
                          submit: () {
                            Navigator.pushNamed(context, MyRouter.joinMeeting,
                                arguments: MeetingArguments(
                                    studentMeetingLink: state
                                        .upcomingSchedule!.studentMeetingLink));
                          },
                          isLoading: false,
                          height: 35.h,
                          textColor: primaryColor,
                          primaryColor: Colors.white,
                          label: AppLocalizations.of(context)!
                              .dash_board_enter_room,
                        ),
                      ),
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
