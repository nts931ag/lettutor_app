import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/presentation/commons/widgets/box_shadow_container.dart';
import 'package:lettutor_app/presentation/commons/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/commons/widgets/icon/circle_box_widget.dart';
import 'package:lettutor_app/resource/colors/colors_core.dart';
import 'package:lettutor_app/resource/dimens.dart';
import 'package:lettutor_app/resource/gen/assets.gen.dart';
import 'package:lettutor_app/resource/theme/text_theme.dart';

class InformationTutorContainer extends StatelessWidget {
  double countRating;

  InformationTutorContainer({
    Key? key,
    required this.countRating,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
          child: BoxShadowContainer(
            padding: EdgeInsets.all(30.w),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            width: Get.width - 20.w - 6.w,
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
                  'Jennie',
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
                      'United States',
                      style: text16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                countRating == 0
                    ? Text(
                  AppLocalizations.of(context)!.dash_board_no_review,
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
                    // TODO: fill list type
                    // ...controller.listType
                    //     .map((e) => TextContainer(
                    //           title: e,
                    //           textColor: primaryColor,
                    //           color: primaryColor.withOpacity(0.2),
                    //         ))
                    //     .toList()
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
                          // TODO: Navigation to Tutor Detail
                          // Get.toNamed(AppRoutes.TUTOR_DETAIL);
                        },
                        height: 30.h,
                        isLoading: false,
                        primaryColor: primaryColor.withOpacity(0.5),
                        label: AppLocalizations.of(context)!.book),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 30.w,
          top: 30.h,
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 25,
          ),
        )
      ],
    );
  }
}
