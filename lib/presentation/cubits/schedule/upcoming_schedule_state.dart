part of 'upcoming_schedule_cubit.dart';

abstract class UpcomingScheduleState extends Equatable {
  final Schedule? upcomingSchedule;
  final int? totalHours;
  final DioError? error;

  const UpcomingScheduleState(
      {this.upcomingSchedule, this.totalHours, this.error});

  @override
  List<Object?> get props => [upcomingSchedule, totalHours, error];
}

class UpcomingScheduleLoading extends UpcomingScheduleState {
  const UpcomingScheduleLoading();
}

class UpcomingScheduleSuccess extends UpcomingScheduleState {
  const UpcomingScheduleSuccess({super.upcomingSchedule, super.totalHours});
}

class UpcomingScheduleFailed extends UpcomingScheduleState {
  const UpcomingScheduleFailed({super.error});
}
