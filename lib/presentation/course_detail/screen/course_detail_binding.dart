import 'package:get/get.dart';
import 'package:lettutor_app/presentation/course_detail/screen/course_detail_controller.dart';

class CourseDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CourseDetailController());

  }
}
