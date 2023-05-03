// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/presentation/widgets/base/base_scaffold_custom_widget.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/base_infor_tutor.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/tutor_main_detail.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/tutor_video.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';

class TutorDetailScreen extends HookWidget {
  const TutorDetailScreen({Key? key, required this.tutor}) : super(key: key);
  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
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
