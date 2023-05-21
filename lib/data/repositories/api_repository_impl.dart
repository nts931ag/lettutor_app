import 'package:dio/dio.dart';
import 'package:lettutor_app/data/datasources/remote/authentication_service.dart';
import 'package:lettutor_app/data/datasources/remote/course_service.dart';
import 'package:lettutor_app/data/datasources/remote/schedule_service.dart';
import 'package:lettutor_app/data/datasources/remote/tutor_service.dart';
import 'package:lettutor_app/data/datasources/remote/user_service.dart';
import 'package:lettutor_app/data/repositories/base/base_api_repository.dart';
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
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/utils/constant/const_value.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final AuthenticationService _authenticationService;
  final TutorService _tutorService;
  final CourseService _courseService;
  final ScheduleService _scheduleService;
  final UserService _userService;

  ApiRepositoryImpl(this._authenticationService, this._tutorService,
      this._courseService, this._scheduleService, this._userService);

  @override
  Future<DataState<UserDataResponse>> loginManually(
      {required String email, required password}) {
    return getStateOf<UserDataResponse>(
      request: () => _authenticationService.loginByEmailPassword(
        {"email": email, "password": password},
      ),
    );
  }

  @override
  Future<DataState<String>> forgotPassword({required String email}) {
    return getStateOf<String>(
      request: () => _authenticationService.forgotPassword(
        {
          "email": email,
        },
      ),
    );
  }

  @override
  Future<DataState<TutorsDataResponse>> getTutorsWithPagination(
      {required int perPage, required int page}) {
    return getStateOf<TutorsDataResponse>(
        request: () => _tutorService.getListTutorWithPagination(perPage, page));
  }

  @override
  Future<DataState<CoursesDataResponse>> getCoursesWithPagination(
      {required int page, required int size, required searchKey}) {
    return getStateOf<CoursesDataResponse>(
        request: () =>
            _courseService.getListCourseWithPagination(page, size, searchKey));
  }

  @override
  Future<DataState<SchedulesDataResponse>>
      getListHistoryScheduleWithPagination({
    required int perPage,
    required int page,
    required int dateTimeLte,
    required String orderBy,
    required String sortBy,
  }) {
    return getStateOf<SchedulesDataResponse>(
        request: () => _scheduleService.getListHistoryScheduleWithPagination(
            perPage, page, dateTimeLte, orderBy, sortBy));
  }

  @override
  Future<DataState<SchedulesDataResponse>> getListScheduleWithPagination({
    required int perPage,
    required int page,
    required int dateTimeGte,
    required String orderBy,
    required String sortBy,
  }) {
    return getStateOf<SchedulesDataResponse>(
        request: () => _scheduleService.getListScheduleWithPagination(
            perPage, page, dateTimeGte, orderBy, sortBy));
  }

  @override
  Future<DataState<UserDataResponse>> updateUserInformation(
      User user, List<Specialities> specialities) {
    var learnTopics = [];
    var testPreparations = [];
    for (var element in specialities) {
      if (element.group == SpecialitiesGroup.topic) {
        learnTopics.add(element.id);
      } else {
        testPreparations.add(element.id);
      }
    }
    return getStateOf(
      request: () => _userService.updateUserInformation(
        {
          "name": user.name,
          "country": user.country,
          "phone": user.phone,
          "birthday": user.birthday,
          "level": user.level,
          "learnTopics": learnTopics,
          "testPreparations": testPreparations
        },
      ),
    );
  }

  @override
  Future<DataState<User>> uploadAvatar(String imagePath) async {
    final formDataImage = FormData.fromMap({
      'avatar': await MultipartFile.fromFile(
        imagePath,
      ),
    });
    return getStateOf<User>(
        request: () => _userService.uploadAvatar(formDataImage));
  }

  @override
  Future<DataState<TutorsDataResponse>> searchTutorsWithPagination(
      TutorSearchRequest tutorSearchRequest) {
    return getStateOf<TutorsDataResponse>(
        request: () => _tutorService.searchListTutorWithPagination({
              "filters": {
                "specialties": tutorSearchRequest.filters != null
                    ? tutorSearchRequest.filters!.specialties
                    : [],
                "nationality": [],
              },
              "search": tutorSearchRequest.search,
              "page": "${tutorSearchRequest.page}",
              "perPage": tutorSearchRequest.perPage
            }));
  }

  @override
  Future<DataState<Tutor>> getTutorDetailByTutorId({required String tutorId}) {
    // TODO: implement getTutorDetail
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> manageFavoriteTutor({required String tutorId}) {
    return getStateOf<void>(
        request: () => _tutorService.manageFavoriteTutor({'tutorId': tutorId}));
  }

  @override
  Future<DataState<void>> reportTutor(
      {required String tutorId, required String content}) {
    return getStateOf<void>(
        request: () => _tutorService
            .reportTutor({'tutorId': tutorId, 'content': content}));
  }

  @override
  Future<DataState<TotalHoursReponse>> getTotalHours() {
    return getStateOf<TotalHoursReponse>(
      request: () => _scheduleService.getTotalHours(),
    );
  }

  @override
  Future<DataState<UpcomingSchedulesResponse>> getUpcomingSchedule() {
    return getStateOf<UpcomingSchedulesResponse>(
      request: () => _scheduleService
          .getUpcomingSchedule(DateTime.now().millisecondsSinceEpoch),
    );
  }

  @override
  Future<DataState<FeedbacksDataResponse>> getFeedbacksByTutorId(
      {required String tutorId, required int page, required int perPage}) {
    return getStateOf<FeedbacksDataResponse>(
      request: () => _tutorService.getFeedbackByTutorId(tutorId, page, perPage),
    );
  }

  @override
  Future<DataState<CancelBookingDataResponse>> cancelBooking(
      {required String id, required int reasonId}) {
    return getStateOf<CancelBookingDataResponse>(
      request: () => _scheduleService.cancelBooking(
        {
          "scheduleDetailIds": [id],
          "cancelInfo": {"cancelReasonId": reasonId}
        },
      ),
    );
  }

  @override
  Future<DataState<BookingSchedulesDataReponse>> getBookingScheduleOfTutor(
      {required String tutorId,
      required int startTimestamp,
      required int endTimestamp}) {
    return getStateOf<BookingSchedulesDataReponse>(
        request: () => _scheduleService.getBookingScheduleOfTutor(
            tutorId, startTimestamp, endTimestamp));
  }

  @override
  Future<DataState<BookingClassResponse>> bookClass(
      {required List<String> scheduleDetailId, required String note}) {
    return getStateOf<BookingClassResponse>(
      request: () => _scheduleService.bookClass(
        {"scheduleDetailIds": scheduleDetailId, "note": note},
      ),
    );
  }
}
