import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/app/app_pages.dart';
import 'package:lettutor_app/presentation/common/widgets/icon/circle_box_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/icon/icon_text_widget.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class BaseInforTutor extends StatelessWidget {
  const BaseInforTutor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 35.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleBox(
                    size: 110.w,
                    child: Assets.images.img.image(fit: BoxFit.cover)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Joan Gacer',
                      style: text20.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 4,
                      maxRating: 4,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 5,
                      ),
                      onRatingUpdate: (rating) {},
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
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.',
            style: text16.copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconText(
                iconData: Icons.favorite,
                title: LocalString.favorite,
              ),
              IconText(
                iconData: Icons.report,
                title: LocalString.report,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.REVIEW);
                },
                child: IconText(
                  iconData: Icons.star,
                  title: LocalString.reviews,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
