import 'package:get/get.dart';
import 'package:lettutor_app/presentation/history/screen/history_controller.dart';

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HistoryController());
  }
}
