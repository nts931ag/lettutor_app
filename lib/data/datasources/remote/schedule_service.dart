import 'package:dio/dio.dart';
import 'package:lettutor_app/domain/models/responses/BookingClassResponse.dart';
import 'package:lettutor_app/domain/models/responses/BookingSchedulesDataReponse.dart';
import 'package:lettutor_app/domain/models/responses/CancelBookingDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/SchedulesDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/TotalHoursResponse.dart';
import 'package:lettutor_app/domain/models/responses/UpcomingSchedulesResponse.dart';
import 'package:lettutor_app/utils/constant/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'schedule_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class ScheduleService {
  factory ScheduleService(Dio dio, {String baseUrl}) = _ScheduleService;

  @GET('booking/list/student')
  Future<HttpResponse<SchedulesDataResponse>> getListScheduleWithPagination(
    @Query("perPage") int perPage,
    @Query("page") int page,
    @Query("dateTimeGte") int dateTimeGte,
    @Query("orderBy") String orderBy,
    @Query("sortBy") String sortBy,
  );

  @GET('booking/list/student')
  Future<HttpResponse<SchedulesDataResponse>>
      getListHistoryScheduleWithPagination(
    @Query("perPage") int perPage,
    @Query("page") int page,
    @Query("dateTimeLte") int dateTimeLte,
    @Query("orderBy") String orderBy,
    @Query("sortBy") String sortBy,
  );

  @GET('booking/next')
  Future<HttpResponse<UpcomingSchedulesResponse>> getUpcomingSchedule(
    @Query("dateTime") int dateTime,
  );

  @GET('call/total')
  Future<HttpResponse<TotalHoursReponse>> getTotalHours();

  @DELETE('booking')
  Future<HttpResponse<CancelBookingDataResponse>> cancelBooking(
      @Body() request);

  @GET('schedule')
  Future<HttpResponse<BookingSchedulesDataReponse>> getBookingScheduleOfTutor(
      @Query('tutorId') String tutorId,
      @Query('startTimestamp') int startTimestamp,
      @Query('endTimestamp') int endTimestamp);

  @POST('booking')
  Future<HttpResponse<BookingClassResponse>> bookClass(
    @Body() request,
  );
}
