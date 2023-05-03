part of 'history_list_cubit.dart';

abstract class HistoryListState extends Equatable {
  final List<Schedule> schedules;
  final bool noMoreData;
  final DioError? error;


  const HistoryListState({
    this.schedules = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [schedules, noMoreData, error];
}

class HistoryListLoading extends HistoryListState {
  const HistoryListLoading();
}

class HistoryListSuccess extends HistoryListState {
  const HistoryListSuccess({super.schedules, super.noMoreData});
}

class HistoryListFailed extends HistoryListState {
  const HistoryListFailed({super.error});
}