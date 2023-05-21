import 'package:dio/dio.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/domain/models/responses/BookingSchedulesDataReponse.dart';
import 'package:lettutor_app/domain/models/responses/FeedbacksDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/TutorsDataResponse.dart';
import 'package:lettutor_app/utils/constant/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'tutor_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class TutorService {
  factory TutorService(Dio dio, {String baseUrl}) = _TutorService;

  @GET('tutor/more')
  Future<HttpResponse<TutorsDataResponse>> getListTutorWithPagination(
    @Query("perPage") int perPage,
    @Query("page") int page,
  );

  @GET('tutor')
  Future<HttpResponse<Tutor>> getTutorDetailByTutorId(
    @Query("tutorId") String tutorId,
  );

  @POST('tutor/search')
  Future<HttpResponse<TutorsDataResponse>> searchListTutorWithPagination(
      @Body() request);

  @POST('user/manageFavoriteTutor')
  Future<HttpResponse<void>> manageFavoriteTutor(
    @Body() request,
  );

  @POST('report')
  Future<HttpResponse<void>> reportTutor(@Body() request);

  @GET('feedback/v2/{id}')
  Future<HttpResponse<FeedbacksDataResponse>> getFeedbackByTutorId(
      @Path() String id,
      @Query("page") int page,
      @Query("perPage") int perPage);

}
