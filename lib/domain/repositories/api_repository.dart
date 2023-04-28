import 'package:lettutor_app/domain/models/responses/TutorsDataResponse.dart';
import 'package:lettutor_app/domain/models/responses/UserDataResponse.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';


abstract class ApiRepository {
  Future<DataState<UserDataResponse>> loginManually({required String email, required password});
  Future<DataState<String>> forgotPassword({required String email});
  Future<DataState<TutorsDataResponse>> getTutorsWithPagination({required int perPage, required int page});
}