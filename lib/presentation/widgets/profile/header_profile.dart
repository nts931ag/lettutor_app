import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/presentation/cubits/authentication/auth_cubit.dart';
import 'package:lettutor_app/presentation/widgets/profile/logo_profile.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.0.r),
          topRight: Radius.circular(5.0.r),
        ),
        color: greyColor.withOpacity(0.2),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10.0.h,
        ),
        Center(
          child: LogoProfile(url: authCubit.state.user!.avatar),
        ),
        Text(
          authCubit.state.user!.name!,
          style: text24.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        Text(
          '${AppLocalizations.of(context)!.profile_account_id} ${authCubit.state.user!.id}',
          style: text14.copyWith(color: greyColor),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context)!.profile_others_review,
            style: text14.copyWith(color: primaryColor),
          ),
        ),
      ]),
    );
  }
}
