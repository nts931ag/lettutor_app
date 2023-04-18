// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/commons/widgets/text/text_container_widget.dart';
import 'package:lettutor_app/presentation/commons/widgets/text/text_link_widget.dart';
import 'package:lettutor_app/presentation/widgets/tutor_detail/section_detail.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TutorMainDetail extends StatelessWidget {
  const TutorMainDetail({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTutorDetail(
          title: AppLocalizations.of(context)!.languages,
          child: TextContainer(
            title: 'English',
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
              // TODO list special
              // ...controller.listSpecial.map(
              //   (e) => TextContainer(
              //     title: e,
              //     color: primaryColor.withOpacity(0.2),
              //     textColor: primaryColor,
              //   ),
              // )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SectionTutorDetail(
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
        ),
        SizedBox(
          height: 20.h,
        ),
        SectionTutorDetail(
          title: AppLocalizations.of(context)!.interests,
          child: Text(
            'I loved the weather, the scenery and the laid-back lifestyle of the locals.',
            style: text15.copyWith(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SectionTutorDetail(
          title: AppLocalizations.of(context)!.tutor_detail_ex,
          child: Text(
            'I have more than 10 years of teaching english experience',
            style: text15.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
