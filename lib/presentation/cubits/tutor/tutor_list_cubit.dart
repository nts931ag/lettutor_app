import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/domain/models/requests/Filter.dart';
import 'package:lettutor_app/domain/models/requests/TutorSearchRequest.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/presentation/cubits/base/base_cubit.dart';
import 'package:lettutor_app/utils/constant/nums.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

part 'tutor_list_state.dart';

class TutorListCubit extends BaseCubit<TutorListState, List<Tutor>> {
  final ApiRepository _apiRepository;

  TutorListCubit(this._apiRepository) : super(const TutorListLoading(), []);
  int _page = 1;
  String _searchKey = '';
  List<String> _specialitiesSelected = const [];

  Future<void> getTutorWithPagination() async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getTutorsWithPagination(
          perPage: defaultPageSize, page: _page);

      if (response is DataSuccess) {
        final tutors = response.data!.tutors;
        final noMoreData = response.data!.tutorCount < defaultPageSize;

        data!.addAll(tutors!);
        _page++;

        emit(TutorListSuccess(tutors: List.of(data!), noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(TutorListFailed(error: response.error));
      }
    });
  }

  Future<void> searchTutorsWithPaginationFor1stTime() async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.searchTutorsWithPagination(
          TutorSearchRequest(
              search: "", page: _page, perPage: defaultPageSize));

      if (response is DataSuccess) {
        final tutors = response.data!.tutors;
        final noMoreData = response.data!.tutorCount < defaultPageSize;

        data!.addAll(sortTutorsByFavouriteAndRating(tutors!));
        _page++;

        emit(TutorListSuccess(tutors: List.of(data!), noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(TutorListFailed(error: response.error));
      }
    });
  }

  Future<void> searchTutorsWithPagination({
    String? searchKey,
    List<String>? specialitiesSelected,
    int? page,
    bool isScrollToLoadmore = false,
  }) async {
    if (isBusy) return;

    await run(() async {
      if (!isScrollToLoadmore) {
        _searchKey = searchKey!;
        _specialitiesSelected = specialitiesSelected!;
        _page = page!;
        data!.clear();
      }

      if (!isScrollToLoadmore) {
        emit(const TutorListLoading());
      }

      final response = await _apiRepository.searchTutorsWithPagination(
          TutorSearchRequest(
              search: _searchKey,
              filters: Filter(specialties: _specialitiesSelected),
              page: page ?? _page,
              perPage: defaultPageSize));

      if (response is DataSuccess) {
        final tutors = response.data!.tutors;
        if (response.data!.tutorCount != 0) {
          final noMoreData = response.data!.tutorCount < defaultPageSize;
          data!.addAll(sortTutorsByFavouriteAndRating(tutors!));
          _page++;

          emit(TutorListSuccess(tutors: List.of(data!), noMoreData: noMoreData));
        } else {
          emit(const TutorListEmptySuccess());
        }

      } else if (response is DataFailed) {
        emit(TutorListFailed(error: response.error));
      }
    });
  }

  List<Tutor> sortTutorsByFavouriteAndRating(List<Tutor> tutors) {
    final tutorsSorted = List<Tutor>.from(tutors);

    tutorsSorted.sort(
      (a, b) {
        int favouriteA = a.isFavoriteTutor ? 1 : 0;
        int favouriteB = b.isFavoriteTutor ? 1 : 0;
        int favouriteCompare = favouriteB.compareTo(favouriteA);
        if (favouriteCompare == 0) {
          return -a.rating.compareTo(b.rating);
        }
        return favouriteCompare;
      },
    );
    return tutorsSorted;
  }

  void onReportTutorSuccess(Tutor reportedTutor) {}

  void onAddTutorFavouriteSuccess(Tutor favouriteTutor) {
    final tutors = List<Tutor>.of(data!);
    final indexOfOldTutor =
        state.tutors.indexWhere((element) => element.id == favouriteTutor.id);
    tutors[indexOfOldTutor] = favouriteTutor;
    data!.clear();
    data!.addAll(sortTutorsByFavouriteAndRating(tutors));
    emit(
        TutorListSuccess(tutors: List.of(data!), noMoreData: state.noMoreData));
  }
}
