import 'package:dio/dio.dart';
import 'package:lettutor_app/domain/models/responses/TutorsDataResponse.dart';
import 'package:lettutor_app/utils/constant/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'tutor_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class TutorService {
  factory TutorService(Dio dio,
      {String baseUrl}) = _TutorService;

  @GET('tutor/more')
  Future<HttpResponse<TutorsDataResponse>> getListTutorWithPagination(
      @Query("perPage") int perPage,
      @Query("page") int page,
      );

}