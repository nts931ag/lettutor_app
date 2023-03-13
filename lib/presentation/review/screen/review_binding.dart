import 'package:get/get.dart';
import 'package:lettutor_app/presentation/review/screen/review_controller.dart';

class ReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ReviewController());

  }
}
