import 'package:dio/dio.dart';
import 'package:lettutor_app/data/datasources/remote/authentication_service.dart';
import 'package:lettutor_app/data/datasources/remote/course_service.dart';
import 'package:lettutor_app/data/datasources/remote/schedule_service.dart';
import 'package:lettutor_app/data/datasources/remote/tutor_service.dart';
import 'package:lettutor_app/data/datasources/remote/user_service.dart';
import 'package:lettutor_app/data/repositories/base/base_api_repository.dart';
import 'package:lettutor_app/domain/models/User.dart';
import 'package:lettutor_app/domain/models/requests/TutorSearchRequest.dart';
import 'package:lettutor_app/domain/models/responses/CoursesDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/SchedulesDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/TutorsDataResponse.dart';
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
      {required int page, required int size}) {
    return getStateOf<CoursesDataResponse>(
        request: () => _courseService.getListCourseWithPagination(page, size));
  }

  @override
  Future<DataState<SchedulesDataResponse>>
      getListHistoryScheduleWithPagination({
    required perPage,
    required page,
    required dateTimeLte,
    required orderBy,
    required sortBy,
  }) {
    return getStateOf<SchedulesDataResponse>(
        request: () => _scheduleService.getListHistoryScheduleWithPagination(
            perPage, page, dateTimeLte, orderBy, sortBy));
  }

  @override
  Future<DataState<SchedulesDataResponse>> getListScheduleWithPagination({
    required perPage,
    required page,
    required dateTimeGte,
    required orderBy,
    required sortBy,
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
    final searchTutorForm = FormData.fromMap({
      'search': tutorSearchRequest.search,
      'page' : tutorSearchRequest.page,
      'perPage' : tutorSearchRequest.perPage
    });

    return getStateOf<TutorsDataResponse>(
        request: () =>
            _tutorService.searchListTutorWithPagination({
              "filters": {
                "specialties": [],
                "nationality": [],
                "date": null,
                "tutoringTimeAvailable": [null, null]
              },
              "search": "",
              "page": "${tutorSearchRequest.page}",
              "perPage": 10
            }));
  }
}
