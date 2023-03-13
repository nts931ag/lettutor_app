import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/controllers/base_controller.dart';

class CourseController extends BaseController {
  Rx<int> index = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReloadData() {}

  onTapInDexTabBar(int i) {
    print(i);
    index.value = i;
  }
}
