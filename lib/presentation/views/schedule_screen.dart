// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lettutor_app/domain/models/Schedule.dart';
import 'package:lettutor_app/presentation/cubits/schedule/schedule_list_cubit.dart';
import 'package:lettutor_app/presentation/widgets/schedule/header_item.dart';
import 'package:lettutor_app/presentation/widgets/schedule/schedule_item.dart';
import 'package:lettutor_app/utils/extensions/scroll_controller_extensions.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';

class ScheduleScreen extends HookWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheduleListCubit = BlocProvider.of<ScheduleListCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        scheduleListCubit.getScheduleListWithPagination();
      });

      return scrollController.dispose;
    }, const []);

    return _buildCommonCustomScrollView(context, scrollController);
  }

  Widget _buildSchedules(
    BuildContext context,
    List<Schedule> schedules,
    bool noMoreData,
  ) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: schedules.length,
        (context, index) => Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            ScheduleItem(schedule: schedules[index]),
          ],
        ),
      ),
    );
  }

  Widget _buildCommonCustomScrollView(
    BuildContext context,
    ScrollController scrollController,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 25.h,
          ),
          // const InformationCourse(),
          HeaderItem(
            img:
                Assets.svg.schedule.iconSchedule.svg(height: 80.w, width: 80.w),
            lowerContent: AppLocalizations.of(context)!.schedule_title,
            upperContent: AppLocalizations.of(context)!.schedule,
            lowerSubContent: AppLocalizations.of(context)!.schedule_sub_title,
          ),
        ])),
        BlocBuilder<ScheduleListCubit, ScheduleListState>(
          builder: (_, state) {
            switch (state.runtimeType) {
              case ScheduleListLoading:
                return const SliverToBoxAdapter(
                    child: Center(child: CupertinoActivityIndicator()));
              case ScheduleListFailed:
                return const SliverToBoxAdapter(
                    child: Center(child: Icon(Ionicons.refresh)));
              case ScheduleListSuccess:
                return _buildSchedules(
                  context,
                  state.schedules,
                  state.noMoreData,
                );
              default:
                return const SizedBox();
            }
          },
        ),
        BlocBuilder<ScheduleListCubit, ScheduleListState>(
          builder: (_, state) {
            switch (state.runtimeType) {
              case ScheduleListSuccess:
                return (!state.noMoreData)
                    ? const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: 14, bottom: 32),
                          child: CupertinoActivityIndicator(),
                        ),
                      )
                    : const SliverToBoxAdapter();
              default:
                return const SliverToBoxAdapter();
            }
          },
        ),
      ],
    );
  }
}
