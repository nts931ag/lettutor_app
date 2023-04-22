import 'package:lettutor_app/data/datasources/remote/authentication_service.dart';
import 'package:lettutor_app/data/repositories/base/base_api_repository.dart';
import 'package:lettutor_app/domain/models/authentication/UserData.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final AuthenticationService _authenticationService;
  ApiRepositoryImpl(this._authenticationService);

  @override
  Future<DataState<UserData>> loginManually({required String email, required password}) {
    return getStateOf<UserData>(request: () => _authenticationService.loginByEmailPassword({
      "email": email,
      "password": password
    }));
  }
  

}