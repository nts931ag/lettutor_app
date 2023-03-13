import 'package:get/get.dart';
import 'package:lettutor_app/presentation/course/screen/course_controller.dart';

class CourseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CourseController());

  }
}
