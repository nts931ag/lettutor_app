import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

setupApp() async {
  // Set up service

  // Set up repository

  //
}

setupStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
