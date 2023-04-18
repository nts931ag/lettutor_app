import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/resource/colors/colors_core.dart';
import 'package:lettutor_app/resource/dimens.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined))
        ],
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Stack(
          children: [_viewRows(), _toolBar()],
        ),
      ),
    );
  }

  Widget _viewRows() {
    return Container(
      decoration: BoxDecoration(color: blackColor),
    );
  }

  Widget _toolBar() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(vertical: 48.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            elevation: 2.h,
            fillColor: whiteColor,
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.mic,
              color: blueColor,
              size: 20.h,
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              Get.back();
            },
            shape: const CircleBorder(),
            elevation: 2.h,
            fillColor: redColor,
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.call_end,
              color: whiteColor,
              size: 35.h,
            ),
          ),
          RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            elevation: 2.h,
            fillColor: whiteColor,
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.switch_camera,
              color: blueColor,
              size: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}
