// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/locator.dart';
import 'package:lettutor_app/presentation/cubits/authentication/auth_cubit.dart';
import 'package:lettutor_app/presentation/cubits/profile/profile_cubit.dart';
import 'package:lettutor_app/presentation/widgets/commons/circle_network_image.dart';
import 'package:lettutor_app/presentation/widgets/profile/header_profile.dart';
import 'package:lettutor_app/presentation/widgets/profile/profile_field.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/colors.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ProfileCubit(
          locator<ApiRepository>(), BlocProvider.of<AuthCubit>(context))
        ..getInformationOfCurrentUser(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 30.h),
            decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                border: Border.all(color: ColorName.greyColor, width: 2.0)),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 5.0,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0.r),
                        topRight: Radius.circular(5.0.r),
                      )),
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: BlocBuilder<ProfileCubit, ProfileState>(
                            buildWhen: (pre, cur) => pre.avatar != cur.avatar,
                            builder: (context, state) {
                              return CircleNetworkImage(
                                  url: state.avatar, size: 150.w);
                            },
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border:
                                Border.all(color: Colors.blue, width: 2)),
                            margin: const EdgeInsets.only(left: 100),
                            child: BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                                return IconButton(
                                  onPressed: () {
                                    _getFromGallery(context);
                                  },
                                  icon: const Icon(
                                    Icons.photo_camera,
                                    color: Colors.blue,
                                  ),
                                  iconSize: 24,
                                );
                              },
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 35.h),
                Container(
                  height: 46.h,
                  color: ColorName.greyColor,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(12.0.w),
                  child: Text(
                    AppLocalizations.of(context)!.account,
                    style: text14,
                  ),
                ),
                const ProfileField()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getFromGallery(context) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      BlocProvider.of<ProfileCubit>(context).onUploadAvatar(pickedFile.path);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
              'Upload avatar successfully!', style: text14,)),
      );
    }
  }
}
