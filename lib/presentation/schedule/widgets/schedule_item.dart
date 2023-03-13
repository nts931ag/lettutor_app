import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/common/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/items/item_widget.dart';
import 'package:lettutor_app/res/colors/colors_core.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
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
      subTime: '1 lesson',
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '18:30 - 18:55',
                  style: text16,
                ),
                SizedBox(
                  width: 80.w,
                  height: 30.h,
                  child: LoadingButtonWidget(
                      submit: () {},
                      isLoading: false,
                      primaryColor: Colors.red,
                      label: LocalString.cancel),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.expand_more,
                          size: 15.w,
                        ),
                        Text(
                          LocalString.scheduleRequest,
                          style: text14,
                        ),
                        Text(
                          LocalString.scheduleEditRequest,
                          style: text14.copyWith(color: primaryColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10.w),
                    child: Text(
                      LocalString.scheduleRequestContent,
                      style: text14.copyWith(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
