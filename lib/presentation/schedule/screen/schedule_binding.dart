import 'package:get/get.dart';
import 'package:lettutor_app/presentation/schedule/screen/schedule_controller.dart';

class ScheduleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ScheduleController());
  }
}
