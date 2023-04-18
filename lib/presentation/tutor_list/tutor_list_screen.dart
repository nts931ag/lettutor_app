// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/presentation/tutor_list/widgets/filter_area.dart';
import 'package:lettutor_app/presentation/tutor_list/widgets/header_dash_board.dart';
import 'package:lettutor_app/presentation/tutor_list/widgets/information_tutor_container.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';

class TutorListScreen extends StatelessWidget {
  const TutorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderDashboard(),
          SizedBox(
            height: 33.h,
          ),
          FilterTutorArea(),
          SizedBox(
            height: 33.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.dash_board_recommend_tutor,
                style: text20.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15.h,
              ),
              InformationTutorContainer(
                countRating: 0,
              ),
              SizedBox(
                height: 15.h,
              ),
              InformationTutorContainer(
                countRating: 4,
              )
            ],
          ),
          SizedBox(
            height: 33.h,
          ),
        ],
      ),
    );
  }
}
