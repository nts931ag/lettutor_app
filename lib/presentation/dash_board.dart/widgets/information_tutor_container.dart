import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:lettutor_app/app/app_pages.dart';
import 'package:lettutor_app/presentation/common/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/icon/circle_box_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/text/text_container_widget.dart';
import 'package:lettutor_app/presentation/dash_board.dart/screen/dashboard_controller.dart';
import 'package:lettutor_app/res/colors/colors_core.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';
import 'package:lettutor_app/res/gen/colors.gen.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class InformationTutorContainer extends StatelessWidget {
  double countRating;
  InformationTutorContainer({
    Key? key,
    required this.countRating,
    required this.controller,
  }) : super(key: key);

  final DashBoardController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(30.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(width: 2.0.r, color: ColorName.greyColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleBox(
                    size: 80.w,
                    child: Assets.images.img.image(fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Joan Gacer',
                  style: text20.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Assets.svg.common.iconUs.svg(height: 15.w, width: 25.w),
                    SizedBox(width: 15.w),
                    Text(
                      'Taiwan',
                      style: text16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                countRating == 0
                    ? Text(
                  LocalString.dashBoardNoReview,
                  style: text16.copyWith(color: Colors.grey),
                )
                    : RatingBar.builder(
                  initialRating: countRating,
                  minRating: countRating,
                  maxRating: countRating,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding:
                  const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 5,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(
                  height: 15.h,
                ),
                Wrap(
                  spacing: 5.w,
                  runSpacing: 10.h,
                  children: [
                    ...controller.listType
                        .map((e) => TextContainer(
                      title: e,
                      textColor: primaryColor,
                      color: primaryColor.withOpacity(0.2),
                    ))
                        .toList()
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: Get.width / 2 - 30.w,
                    child: LoadingButtonWidget(
                        submit: () {
                          Get.toNamed(AppRoutes.TUTOR_DETAIL);
                        },
                        height: 30.h,
                        isLoading: false,
                        primaryColor: primaryColor.withOpacity(0.5),
                        label: LocalString.book),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            )),
        Positioned(
            right: 30.w,
            top: 30.h,
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ))
      ],
    );
  }
}
