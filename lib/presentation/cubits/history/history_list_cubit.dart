import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Schedule.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/base/base_cubit.dart';
import 'package:lettutor_app/utils/constant/nums.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

part 'history_list_state.dart';

class HistoryListCubit extends BaseCubit<HistoryListState, List<Schedule>> {
  final ApiRepository _apiRepository;

  HistoryListCubit(this._apiRepository)
      : super(const HistoryListLoading(), []);

  int _page = 1;
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  Future<void> getHistoryScheduleListWithPagination() async {
    if (isBusy) return;

    await run(() async {
      final response =
      await _apiRepository.getListHistoryScheduleWithPagination(
          page: _page,
          perPage: defaultPageSize,
          dateTimeLte: timestamp,
          orderBy: "meeting",
          sortBy: "desc");

      if (response is DataSuccess) {
        final courses = response.data!.schedules;
        final noMoreData = response.data!.scheduleCount < defaultPageSize;

        data!.addAll(courses!);
        _page++;

        emit(HistoryListSuccess(
            schedules: List.of(data!), noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(HistoryListFailed(error: response.error));
      }
    });
  }
}
