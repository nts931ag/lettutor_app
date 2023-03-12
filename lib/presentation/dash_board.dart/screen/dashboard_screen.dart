// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/dash_board.dart/screen/dashboard_controller.dart';
import 'package:lettutor_app/presentation/dash_board.dart/widgets/filter_area.dart';
import 'package:lettutor_app/presentation/dash_board.dart/widgets/header_dash_board.dart';
import 'package:lettutor_app/presentation/dash_board.dart/widgets/information_tutor_container.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class DashboardScreen extends BaseScreen<DashBoardController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderDashboard(),
          SizedBox(
            height: 33.h,
          ),
          FilterTutorArea(controller: controller),
          SizedBox(
            height: 33.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocalString.dashBoardRecommendTutor,
                style: text20.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15.h,
              ),
              InformationTutorContainer(
                controller: controller,
                countRating: 0,
              ),
              SizedBox(
                height: 15.h,
              ),
              InformationTutorContainer(
                controller: controller,
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
