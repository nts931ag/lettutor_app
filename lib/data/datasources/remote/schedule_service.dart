import 'package:dio/dio.dart';
import 'package:lettutor_app/domain/models/responses/SchedulesDataResponse.dart';
import 'package:lettutor_app/utils/constant/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'schedule_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class ScheduleService {
  factory ScheduleService(Dio dio,
      {String baseUrl}) = _ScheduleService;

  @GET('booking/list/student')
  Future<HttpResponse<SchedulesDataResponse>> getListScheduleWithPagination(
      @Query("perPage") int perPage,
      @Query("page") int page,
      @Query("dateTimeGte") String dateTimeGte,
      @Query("orderBy") orderBy,
      @Query("sortBy") sortBy,
      );

  @GET('booking/list/student')
  Future<HttpResponse<SchedulesDataResponse>> getListHistoryScheduleWithPagination(
      @Query("perPage") int perPage,
      @Query("page") int page,
      @Query("dateTimeLte") String dateTimeGte,
      @Query("orderBy") orderBy,
      @Query("sortBy") sortBy,
      );

}