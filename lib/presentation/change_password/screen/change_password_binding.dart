import 'package:get/get.dart';
import 'package:lettutor_app/presentation/change_password/screen/change_password_controller.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChangePasswordController());

  }
}
