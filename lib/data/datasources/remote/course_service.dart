import 'package:dio/dio.dart';
import 'package:lettutor_app/domain/models/responses/CoursesDataResponse.dart';
import 'package:lettutor_app/utils/constant/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'course_service.g.dart';


@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class CourseService {
  factory CourseService(Dio dio,
      {String baseUrl}) = _CourseService;

  @GET('course')
  Future<HttpResponse<CoursesDataResponse>> getListCourseWithPagination(
      @Query("page") int perPage,
      @Query("size") int page,
      );
}