import 'package:lettutor_app/domain/models/authentication/UserData.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';


abstract class ApiRepository {
  Future<DataState<UserData>> loginManually({required String email, required password});
}