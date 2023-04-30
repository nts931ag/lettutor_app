import 'package:lettutor_app/data/datasources/remote/authentication_service.dart';
import 'package:lettutor_app/data/datasources/remote/course_service.dart';
import 'package:lettutor_app/data/datasources/remote/schedule_service.dart';
import 'package:lettutor_app/data/datasources/remote/tutor_service.dart';
import 'package:lettutor_app/data/repositories/base/base_api_repository.dart';
import 'package:lettutor_app/domain/models/responses/CoursesDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/SchedulesDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/TutorsDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/UserDataResponse.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final AuthenticationService _authenticationService;
  final TutorService _tutorService;
  final CourseService _courseService;
  final ScheduleService _scheduleService;

  ApiRepositoryImpl(this._authenticationService, this._tutorService,
      this._courseService, this._scheduleService);

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
            page, perPage, dateTimeLte, orderBy, sortBy));
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
            page, perPage, dateTimeGte, orderBy, sortBy));
  }
}
