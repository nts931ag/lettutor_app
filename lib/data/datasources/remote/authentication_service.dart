import 'package:dio/dio.dart';
import 'package:lettutor_app/domain/models/responses/UserDataResponse.dart';
import 'package:lettutor_app/utils/constant/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio,
      {String baseUrl}) = _AuthenticationService;

  @POST('auth/login')
  Future<HttpResponse<UserDataResponse>> loginByEmailPassword(@Body() request);
}