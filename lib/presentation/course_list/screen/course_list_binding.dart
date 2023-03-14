import 'package:get/get.dart';
import 'package:lettutor_app/presentation/course_list/screen/course_list_controller.dart';

class CourseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CourseListController());
  }
}
