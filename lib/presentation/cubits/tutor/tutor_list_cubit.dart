import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/base/base_cubit.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

part 'tutor_list_state.dart';

class TutorListCubit extends BaseCubit<TutorListState, List<Tutor>> {
  final ApiRepository _apiRepository;

  TutorListCubit(this._apiRepository) : super(const TutorListLoading(), []);
  int _page = 1;

  Future<void> getTutorWithPagination(int perPage, int page) async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getTutorsWithPagination(
          perPage: perPage, page: page);

      if (response is DataSuccess) {
        final tutors = response.data!.tutors;
        final noMoreData = tutors!.length < 20;

        data!.addAll(tutors);
        _page++;

        emit(TutorListSuccess(tutors: data!, noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(TutorListFailed(error: response.error));
      }
    });
  }
}
