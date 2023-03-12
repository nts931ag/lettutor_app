import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/app/app_main.dart';
import 'package:lettutor_app/app/app_setup.dart';
import 'package:lettutor_app/controllers/app_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupStatusBar();


  await Get.put<AppController>(AppController()).init();
  runApp(LettutorApp());
}
