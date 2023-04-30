import 'package:lettutor_app/domain/models/responses/CoursesDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/SchedulesDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/TutorsDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/UserDataResponse.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

abstract class ApiRepository {
  Future<DataState<UserDataResponse>> loginManually(
      {required String email, required password});

  Future<DataState<String>> forgotPassword({required String email});

  Future<DataState<TutorsDataResponse>> getTutorsWithPagination(
      {required int perPage, required int page});

  Future<DataState<CoursesDataResponse>> getCoursesWithPagination(
      {required int page, required int size});

  Future<DataState<SchedulesDataResponse>> getListScheduleWithPagination({
    required perPage,
    required page,
    required dateTimeGte,
    required orderBy,
    required sortBy,
  });

  Future<DataState<SchedulesDataResponse>> getListHistoryScheduleWithPagination({
    required perPage,
    required page,
    required dateTimeLte,
    required orderBy,
    required sortBy,
  });
}
