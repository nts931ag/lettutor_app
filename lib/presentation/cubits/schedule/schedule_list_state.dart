part of 'schedule_list_cubit.dart';

abstract class ScheduleListState extends Equatable {
  final List<Schedule> schedules;
  final bool noMoreData;
  final DioError? error;


  const ScheduleListState({
    this.schedules = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object> get props => [];
}

class ScheduleListLoading extends ScheduleListState {
  const ScheduleListLoading();
}

class ScheduleListSuccess extends ScheduleListState {
  const ScheduleListSuccess({super.schedules, super.noMoreData});
}

class ScheduleListFailed extends ScheduleListState {
  const ScheduleListFailed({super.error});
}