// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';

import 'package:video_player/video_player.dart';

class TutorVideo extends StatelessWidget {
  const TutorVideo({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx((() => Container(
          height: 260.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: greyColor, width: 2.0.w)),
          // TODO: Load video tutor introdution.
          // child: Center(
          //   child: !controller.isLoadingVideo.value
          //       ? SizedBox(
          //           height: 250.h,
          //           child: Column(
          //             children: [
          //               InkWell(
          //                 onTap: () {
          //                   controller.onTapVideo();
          //                 },
          //                 child: SizedBox(
          //                   height: 220.h,
          //                   child: AspectRatio(
          //                       aspectRatio: controller
          //                           .videoController.value.aspectRatio,
          //                       child: VideoPlayer(controller.videoController)),
          //                 ),
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   !controller.isPlayingVideo.value
          //                       ? InkWell(
          //                           onTap: () {
          //                             controller.onTapVideo();
          //                           },
          //                           child: Icon(
          //                             Icons.play_arrow,
          //                             size: 20.w,
          //                           ),
          //                         )
          //                       : InkWell(
          //                           onTap: () {
          //                             controller.onTapVideo();
          //                           },
          //                           child: Icon(Icons.pause, size: 20.w)),
          //                   SizedBox(
          //                     width: 5.0.w,
          //                   ),
          //                   Flexible(
          //                     child: SizedBox(
          //                       height: 20.h,
          //                       child: VideoProgressIndicator(
          //                           colors: const VideoProgressColors(
          //                               playedColor: primaryColor),
          //                           controller.videoController,
          //                           allowScrubbing: true),
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     width: 5.0.w,
          //                   ),
          //                 ],
          //               )
          //             ],
          //           ))
          //       : SizedBox(
          //           height: 25.w,
          //           width: 25.w,
          //           child: const CircularProgressIndicator(
          //             color: primaryColor,
          //           )),
          // ),
        )));
  }
}
