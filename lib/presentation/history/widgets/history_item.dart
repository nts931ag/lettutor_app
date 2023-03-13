import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/common/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/items/item_widget.dart';
import 'package:lettutor_app/res/colors/colors_core.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemWidget(
        avatar: Assets.images.img.image(fit: BoxFit.cover),
        date: 'Thu, 20 Oct 22',
        imgNation: Assets.svg.common.iconUs.svg(height: 22.w, width: 22.w),
        isDisableButton: false,
        name: 'Keegan',
        subTime: '1 hour ago',
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocalString.historyLessonTime,
                    style: text18,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: LoadingButtonWidget(
                        height: 25.w,
                        submit: () {},
                        isLoading: false,
                        label: LocalString.record),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: Get.width - 40.w,
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              child: Text(
                LocalString.historyNoRquest,
                style: text14.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: Get.width - 40.w,
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              child: Text(
                LocalString.historyTutorHaventRv,
                style: text14.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
                width: Get.width - 40.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocalString.addRating,
                      style: text14.copyWith(color: primaryColor),
                    ),
                    Text(
                      LocalString.report,
                      style: text14.copyWith(color: primaryColor),
                    ),
                  ],
                )),
          ],
        ));
  }
}
