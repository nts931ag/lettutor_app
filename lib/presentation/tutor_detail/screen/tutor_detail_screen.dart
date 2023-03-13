// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/tutor_detail/screen/tutor_detail_controller.dart';
import 'package:lettutor_app/presentation/tutor_detail/widget/base_infor_tutor.dart';
import 'package:lettutor_app/presentation/tutor_detail/widget/tutor_main_detail.dart';
import 'package:lettutor_app/presentation/tutor_detail/widget/tutor_video.dart';
import 'package:lettutor_app/res/dimens.dart';

class TutorDetailScreen extends BaseScreen<TutorDetailController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseInforTutor(),
          SizedBox(
            height: 20.h,
          ),
          TutorVideo(controller: controller),
          SizedBox(
            height: 20.h,
          ),
          TutorMainDetail(controller: controller),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
