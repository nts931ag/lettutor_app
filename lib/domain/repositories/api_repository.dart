import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/domain/models/User.dart';
import 'package:lettutor_app/domain/models/requests/TutorSearchRequest.dart';
import 'package:lettutor_app/domain/models/responses/BookingClassResponse.dart';
import 'package:lettutor_app/domain/models/responses/BookingSchedulesDataReponse.dart';
import 'package:lettutor_app/domain/models/responses/CancelBookingDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/CoursesDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/FeedbacksDataResponse.dart';
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
      {required int page, required int size, required String searchKey});

  Future<DataState<SchedulesDataResponse>> getListScheduleWithPagination({
    required int perPage,
    required int page,
    required int dateTimeGte,
    required String orderBy,
    required String sortBy,
  });

  Future<DataState<UserDataResponse>> updateUserInformation(
      User user, List<Specialities> specialities);

  Future<DataState<SchedulesDataResponse>>
      getListHistoryScheduleWithPagination({
    required int perPage,
    required int page,
    required int dateTimeLte,
    required String orderBy,
    required String sortBy,
  });

  Future<DataState<UpcomingSchedulesResponse>> getUpcomingSchedule();

  Future<DataState<TotalHoursReponse>> getTotalHours();

  Future<DataState<User>> uploadAvatar(String imagePath);

  Future<DataState<void>> manageFavoriteTutor({required String tutorId});

  Future<DataState<void>> reportTutor(
      {required String tutorId, required String content});

  Future<DataState<FeedbacksDataResponse>> getFeedbacksByTutorId(
      {required String tutorId, required int page, required int perPage});

  Future<DataState<CancelBookingDataResponse>> cancelBooking(
      {required String id, required int reasonId});

  Future<DataState<BookingSchedulesDataReponse>> getBookingScheduleOfTutor(
      {required String tutorId,
      required int startTimestamp,
      required int endTimestamp});

  Future<DataState<BookingClassResponse>> bookClass(
      {required List<String> scheduleDetailId, required String note});
}
