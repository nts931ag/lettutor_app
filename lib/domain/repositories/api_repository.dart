import 'package:lettutor_app/domain/models/responses/UserDataResponse.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';


abstract class ApiRepository {
  Future<DataState<UserDataResponse>> loginManually({required String email, required password});
}