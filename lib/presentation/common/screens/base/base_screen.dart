import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/controllers/base_controller.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_scaffold_widget.dart';
import 'package:lettutor_app/presentation/common/screens/drawer/drawer_screen.dart';
import 'package:lettutor_app/presentation/common/widgets/icon/circle_icon_widget.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';
import 'package:lettutor_app/res/gen/colors.gen.dart';
import 'package:lettutor_app/res/languages/localization_service.dart';

abstract class BaseScreen<C extends BaseController> extends GetWidget<C> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BaseScaffoldWidget(
          resizeToAvoidBottomInset: true,
          actions: [
            circleIconNation(),
            if (controller.isHaveDrawer)
              SizedBox(
                width: 15.w,
              ),
            if (controller.isHaveDrawer)
              CircleIconWidget(
                backgroundColor: ColorName.disabledColor,
                borderColor: ColorName.disabledColor,
                padding: 10.w,
                onTap: () {
                  controller.handleOnTapDrawer();
                },
                child: Icon(Icons.list, size: 20.w,),
              )
          ],
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: [
              DrawerPage(),
              buildContentView(context),
            ],
          ));
    });
  }

  Widget buildContentView(BuildContext context);

  CircleIconWidget circleIconNation() {
    return ((controller.locale.value?.languageCode ??
        LocalizationService.EN_US) !=
        LocalizationService.EN_US)
        ? CircleIconWidget(
      backgroundColor: ColorName.disabledColor,
      borderColor: ColorName.disabledColor,
      padding: 10.w,
      onTap: () {
        controller.changeNation(LocalizationService.EN_US);
      },
      child: Assets.svg.common.iconVn.svg(),
    )
        : CircleIconWidget(
      backgroundColor: ColorName.disabledColor,
      borderColor: ColorName.disabledColor,
      padding: 10.w,
      onTap: () {
        controller.changeNation(LocalizationService.VI_VN);
      },
      child: Assets.svg.common.iconUs.svg(),
    );
  }
}
