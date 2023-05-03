import 'package:dio/dio.dart';
import 'package:lettutor_app/domain/models/User.dart';
import 'package:lettutor_app/domain/models/responses/UserDataResponse.dart';
import 'package:lettutor_app/utils/constant/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class UserService {
  factory UserService(Dio dio,
      {String baseUrl}) = _UserService;

  @PUT('user/info')
  Future<HttpResponse<UserDataResponse>> updateUserInformation(@Body() request);
}