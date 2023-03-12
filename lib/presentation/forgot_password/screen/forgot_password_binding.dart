import 'package:get/get.dart';
import 'package:lettutor_app/presentation/forgot_password/screen/forgot_password_controller.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ForgotPasswordController());
  }
}
