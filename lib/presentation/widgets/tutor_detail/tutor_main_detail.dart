// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/domain/models/Tutor.dart';
import 'package:lettutor_app/presentation/widgets/commons/text/text_container_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/text/text_link_widget.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/section_detail.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorMainDetail extends StatelessWidget {
  const TutorMainDetail({
    required this.tutor,
    Key? key,
  }) : super(key: key);

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTutorDetail(
          title: AppLocalizations.of(context)!.languages,
          child: TextContainer(
            title: tutor.languages,
            color: primaryColor.withOpacity(0.2),
            textColor: primaryColor,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SectionTutorDetail(
          title: AppLocalizations.of(context)!.specialties,
          child: Wrap(
            spacing: 5.0.w,
            runSpacing: 5.0.w,
            children: [
              ...tutor.specialties.split(',').map(
                    (e) => TextContainer(
                      title: e,
                      color: primaryColor.withOpacity(0.2),
                      textColor: primaryColor,
                    ),
                  )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        /*SectionTutorDetail(
          title: AppLocalizations.of(context)!.tutor_detail_suggested_course,
          child: Wrap(
            spacing: 5.0.w,
            runSpacing: 5.0.w,
            children: [
              const SizedBox(),
              // TODO list suggest course
              // ...controller.listSuggestCourse.map(
              //   (e) => TextWithLink(
              //     title: e,
              //     onTap: () {},
              //   ),
              // )
            ],
          ),
        ),*/
        SizedBox(
          height: 20.h,
        ),
        SectionTutorDetail(
          title: AppLocalizations.of(context)!.interests,
          child: Text(
            tutor.interests,
            style: text15.copyWith(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SectionTutorDetail(
          title: AppLocalizations.of(context)!.tutor_detail_ex,
          child: Text(
            tutor.experience,
            style: text15.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
