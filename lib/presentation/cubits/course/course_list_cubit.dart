import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Course.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

import '../base/base_cubit.dart';

part 'course_list_state.dart';

class CourseListCubit extends BaseCubit<CourseListState, List<Course>> {
  final ApiRepository _apiRepository;

  CourseListCubit(this._apiRepository) : super(const CourseListLoading(), []);
  int _page = 1;

  Future<void> getCourseWithPagination() async {
    if (isBusy) return;

    await run(() async {
      final response =
          await _apiRepository.getCoursesWithPagination(page: _page, size: 5);

      if (response is DataSuccess) {
        final courses = response.data!.courses;
        final noMoreData = response.data!.courseCount < 5;

        data!.addAll(courses!);
        _page++;

        emit(CourseListSuccess(courses: List.of(data!), noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(CourseListFailed(error: response.error));
      }
    });
  }
}
