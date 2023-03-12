import 'package:get/get.dart';
import 'package:lettutor_app/presentation/login/screen/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
