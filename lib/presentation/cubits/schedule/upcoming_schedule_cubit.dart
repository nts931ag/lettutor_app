import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Schedule.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/base/base_cubit.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

part 'upcoming_schedule_state.dart';

class UpcomingScheduleCubit extends BaseCubit<UpcomingScheduleState, Schedule> {
  final ApiRepository _apiRepository;

  UpcomingScheduleCubit(this._apiRepository)
      : super(UpcomingScheduleLoading(), null);

  Future<void> getUpcomingSchedule() async {
    if (isBusy) return;
    await run(() async {
      final upcomingScheduleReponse =
          await _apiRepository.getListScheduleWithPagination(
              perPage: 1,
              page: 1,
              dateTimeGte: DateTime.now().millisecondsSinceEpoch,
              orderBy: "meeting",
              sortBy: "asc");
      final totalHoursScheduleReponse = await _apiRepository.getTotalHours();
      if (upcomingScheduleReponse is DataSuccess &&
          totalHoursScheduleReponse is DataSuccess) {
        final schedule = upcomingScheduleReponse.data!.schedules;
        final totalHours = totalHoursScheduleReponse.data!.totalHours;
        emit(UpcomingScheduleSuccess(
            upcomingSchedule: schedule!.first, totalHours: totalHours));
      } else if (upcomingScheduleReponse is DataFailed) {
        emit(UpcomingScheduleFailed(error: upcomingScheduleReponse.error));
      } else if (totalHoursScheduleReponse is DataFailed) {
        emit(UpcomingScheduleFailed(error: upcomingScheduleReponse.error));
      }
    });
  }
}
