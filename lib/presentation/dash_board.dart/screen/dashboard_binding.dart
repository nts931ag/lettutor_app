import 'package:get/get.dart';
import 'package:lettutor_app/presentation/dash_board.dart/screen/dashboard_controller.dart';

class DashBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DashBoardController());

  }
}
