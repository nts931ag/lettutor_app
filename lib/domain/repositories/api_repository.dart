import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/domain/models/User.dart';
import 'package:lettutor_app/domain/models/requests/TutorSearchRequest.dart';
import 'package:lettutor_app/domain/models/responses/CoursesDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/SchedulesDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/TotalHoursResponse.dart';
import 'package:lettutor_app/domain/models/responses/TutorsDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/UpcomingSchedulesResponse.dart';
import 'package:lettutor_app/domain/models/responses/UserDataResponse.dart';
import 'package:lettutor_app/utils/constant/const_value.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

abstract class ApiRepository {
  Future<DataState<UserDataResponse>> loginManually(
      {required String email, required password});

  Future<DataState<String>> forgotPassword({required String email});

  Future<DataState<TutorsDataResponse>> getTutorsWithPagination(
      {required int perPage, required int page});

  Future<DataState<Tutor>> getTutorDetailByTutorId({required String tutorId});

  Future<DataState<TutorsDataResponse>> searchTutorsWithPagination(
      TutorSearchRequest tutorSearchRequest);

  Future<DataState<CoursesDataResponse>> getCoursesWithPagination(
      {required int page, required int size});

  Future<DataState<SchedulesDataResponse>> getListScheduleWithPagination({
    required perPage,
    required page,
    required dateTimeGte,
    required orderBy,
    required sortBy,
  });

  Future<DataState<UserDataResponse>> updateUserInformation(
      User user, List<Specialities> specialities);

  Future<DataState<SchedulesDataResponse>>
      getListHistoryScheduleWithPagination({
    required perPage,
    required page,
    required dateTimeLte,
    required orderBy,
    required sortBy,
  });

  Future<DataState<UpcomingSchedulesResponse>> getUpcomingSchedule();

  Future<DataState<TotalHoursReponse>> getTotalHours();

  Future<DataState<User>> uploadAvatar(String imagePath);

  Future<DataState<void>> manageFavoriteTutor({required String tutorId});

  Future<DataState<void>> reportTutor(
      {required String tutorId, required String content});
}
