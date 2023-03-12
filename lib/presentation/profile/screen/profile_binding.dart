import 'package:get/get.dart';
import 'package:lettutor_app/presentation/profile/screen/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
