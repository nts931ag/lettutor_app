// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/presentation/widgets/base/base_scaffold_custom_widget.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/base_infor_tutor.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/tutor_main_detail.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/tutor_video.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:video_player/video_player.dart';

class TutorDetailScreen extends HookWidget {
  const TutorDetailScreen({Key? key, required this.tutor}) : super(key: key);
  final Tutor tutor;



  @override
  Widget build(BuildContext context) {
    /*ValueNotifier<VideoPlayerController> videoControllerState =
        useState<VideoPlayerController>(VideoPlayerController.network(tutor.video ?? ""));

    useEffect(() {
      videoControllerState.value.addListener(() {
        // setState(() {});
      });
      videoControllerState.value.setLooping(true);
      // videoController.value.initialize().then((_) => setState(() {}));
      videoControllerState.value.play();
    }, const []);*/

    return SafeArea(
      child: BaseScaffoldWidgetCustom(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseInforTutor(tutor: tutor),
              SizedBox(
                height: 20.h,
              ),
              TutorVideo(
                tutor: tutor,
              ),
              /*Container(
                height: 260.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: greyColor, width: 2.0.w)),
                child: Center(
                    child:  true *//*!videoControllerState.value.isLoadingVideo.value*//*
                ?
                    SizedBox(
                        height: 250.h,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                // controller.onTapVideo();
                              },
                              child: SizedBox(
                                height: 220.h,
                                child: AspectRatio(
                                    aspectRatio:
                                    videoControllerState.value.value.aspectRatio,
                                    child: VideoPlayer(videoControllerState.value)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                !videoControllerState.value.value.isPlaying
                                    ? InkWell(
                                  onTap: () {
                                    videoControllerState.value.play();
                                  },
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 20.w,
                                  ),
                                )
                                    : InkWell(
                                    onTap: () {
                                      videoControllerState.value.pause();
                                    },
                                    child: Icon(Icons.pause, size: 20.w)),
                                SizedBox(
                                  width: 5.0.w,
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 20.h,
                                    child: VideoProgressIndicator(
                                        colors: const VideoProgressColors(
                                            playedColor: primaryColor),
                                        videoControllerState.value,
                                        allowScrubbing: true),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0.w,
                                ),
                              ],
                            )
                          ],
                        ))
                   : SizedBox(
                    height: 25.w,
                    width: 25.w,
                    child: const CircularProgressIndicator(
                      color: primaryColor,
                    )),
                ),
              ),*/
              SizedBox(
                height: 20.h,
              ),
              TutorMainDetail(tutor: tutor),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
