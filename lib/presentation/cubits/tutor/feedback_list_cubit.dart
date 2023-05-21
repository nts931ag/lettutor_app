import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Feedback.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/base/base_cubit.dart';
import 'package:lettutor_app/utils/constant/nums.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

part 'feedback_list_state.dart';

class FeedbackListCubit extends BaseCubit<FeedbackListState, List<Feedback>> {
  final ApiRepository _apiRepository;

  FeedbackListCubit(this._apiRepository)
      : super(const FeedbackListLoading(), []);

  int _page = 1;

  Future<void> getFeedbackTutorWithTutorId({required String tutorId}) async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getFeedbacksByTutorId(
          tutorId: tutorId, page: _page, perPage: defaultPageSize);

      if (response is DataSuccess) {
        final tutors = response.data!.feedbacks;
        final noMoreData = response.data!.count < defaultPageSize;

        data!.addAll(tutors!);
        _page++;

        emit(FeedbackListSuccess(
            feedbacks: List.of(data!), noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(FeedbackListFailed(error: response.error));
      }
    });
  }
}
