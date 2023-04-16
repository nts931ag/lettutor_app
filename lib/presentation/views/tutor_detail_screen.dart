// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/base_infor_tutor.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/tutor_main_detail.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/tutor_video.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';

class TutorDetailScreen extends StatelessWidget {
  const TutorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseInforTutor(),
          SizedBox(
            height: 20.h,
          ),
          TutorVideo(),
          SizedBox(
            height: 20.h,
          ),
          TutorMainDetail(),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}


