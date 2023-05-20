// ign`ore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';

import 'package:video_player/video_player.dart';

class TutorVideo extends StatefulWidget {
  const TutorVideo({
    required this.tutor,
    Key? key,
  }) : super(key: key);

  final Tutor tutor;

  @override
  State<TutorVideo> createState() => _TutorVideoState();
}

class _TutorVideoState extends State<TutorVideo> {
  late VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.network(widget.tutor.video ?? "");

    _videoPlayerController.addListener(() {
      setState(() {});
    });
    _videoPlayerController.setLooping(true);
    _videoPlayerController.initialize().then((_) => setState(() {}));
    _videoPlayerController.play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: greyColor, width: 2.0.w)),
      child: Center(
          child: /*!_videoPlayerController.isLoadingVideo.value
                ?*/
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
                                  _videoPlayerController.value.aspectRatio,
                              child: VideoPlayer(_videoPlayerController)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          !_videoPlayerController.value.isPlaying
                              ? InkWell(
                                  onTap: () {
                                    _videoPlayerController.play();
                                  },
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 20.w,
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    _videoPlayerController.pause();
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
                                  _videoPlayerController,
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
          /*: SizedBox(
                    height: 25.w,
                    width: 25.w,
                    child: const CircularProgressIndicator(
                      color: primaryColor,
                    )),*/
          ),
    );
  }
}
