import 'package:get/get.dart';
import 'package:lettutor_app/presentation/tutor_detail/screen/tutor_detail_controller.dart';

class TutorDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TutorDetailController());
  }
}
