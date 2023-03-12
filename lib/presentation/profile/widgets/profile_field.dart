// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/common/widgets/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/presentation/common/widgets/text_field/input_field_profile_widget.dart';
import 'package:lettutor_app/presentation/profile/screen/profile_controller.dart';
import 'package:lettutor_app/presentation/profile/widgets/want_to_learn_wrap.dart';
import 'package:lettutor_app/res/constants/local_string.dart';
import 'package:lettutor_app/res/constants/string_constants.dart';
import 'package:lettutor_app/res/dimens.dart';

class ProfileField extends StatelessWidget {
  const ProfileField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
      child: Column(children: [
        //
        InputFieldProfile(
          title: LocalString.profileName,
          isImportant: true,
          child: baseTextField(
              onChanged: (value) {},
              controller: controller.controllers[nameField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profileEmailAddress,
          child: baseTextField(
              readOnly: true,
              onChanged: (value) {},
              controller: controller.controllers[emailField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profileCountry,
          isImportant: true,
          child: baseTextField(
              onChanged: (value) {},
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.expand_more,
                    size: 25,
                  )),
              controller: controller.controllers[countryField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profilePhone,
          isImportant: true,
          child: baseTextField(
              readOnly: true,
              onChanged: (value) {},
              controller: controller.controllers[phoneField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profileBirthday,
          isImportant: true,
          child: baseTextField(
              onChanged: (value) {},
              controller: controller.controllers[birthayDayField],
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_today,
                    size: 15,
                  )),
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profileMyLevel,
          isImportant: true,
          child: baseTextField(
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.expand_more,
                    size: 25,
                  )),
              onChanged: (value) {},
              controller: controller.controllers[levelField],
              hintText: ''),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profileWantToLearn,
          isImportant: true,
          child: const WantToLearnWrap(),
        ),
        SizedBox(height: 15.h),
        //
        InputFieldProfile(
          title: LocalString.profileStudySchedule,
          child: baseTextField(
              maxLine: 4,
              onChanged: (value) {},
              controller: controller.controllers[studyScheduleField],
              hintText:
                  'Note the time of the week you want to study on LetTutor'),
        ),
        SizedBox(height: 15.h),
        //
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height: 40.h,
            width: 130.w,
            child: LoadingButtonWidget(
                submit: () {}, isLoading: false, label: LocalString.save),
          ),
        )
      ]),
    );
  }
}

