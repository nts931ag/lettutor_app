import 'package:awesome_select/awesome_select.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/domain/models/User.dart';
import 'package:lettutor_app/presentation/cubits/authentication/auth_cubit.dart';
import 'package:lettutor_app/presentation/cubits/profile/profile_cubit.dart';
import 'package:lettutor_app/presentation/widgets/commons/buttons/loading_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/text_field/input_field_profile_widget.dart';
import 'package:lettutor_app/utils/constant/const_value.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/utils.dart';

class ProfileField extends StatefulWidget {
  const ProfileField({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileField> createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  // final List<String> levelItems = [
  //   'Pre A1 (Beginner)',
  //   'A1 (Higher Beginner)',
  //   'A2 (Pre-Intermediate)',
  //   'B1 (Intermediate)',
  //   'B2 (Upper-Intermediate)',
  //   'C1 (Advanced)',
  //   'C2 (Proficiency)',
  // ];
  final List<String> levelItems = [
    "BEGINNER",
    "HIGHER_BEGINNER",
    "PRE_INTERMEDIATE",
    "INTERMEDIATE",
    "UPPER_INTERMEDIATE",
    "ADVANCED",
    "PROFICIENCY"
  ];
  final _formKey = GlobalKey<FormState>();

  // final _txtNameController = TextEditingController();
  // final _txtEmailController = TextEditingController();

  // final _txtPhoneController = TextEditingController();
  final _txtBirthdayController = TextEditingController();
  List<Specialities> _selectedSpecialities = [];
  String? _selectedLevel;
  late bool isInitValue = false;
  late User userModel;

  void initValues(AuthCubit authCubit) {
    setState(() {
      userModel = authCubit.state.user!;
      //Set values for form
      // _txtNameController.text = userModel.name!;
      // _txtEmailController.text = userModel.email!;
      // _txtCountryController.text = userModel.country!;
      // _txtPhoneController.text = userModel.phone!;
      _selectedLevel = userModel.level;

      if (userModel.birthday != null) {
        // _txtBirthdayController.text = userModel.birthday!;
      }
      // if (isInitValue == false) {
      //   for (var element in ConstValue.levelList) {
      //     _levelList.add(DropdownMenuItem(
      //       value: element,
      //       child: Text(element),
      //     ));
      //   }
      // }
      isInitValue = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final authCubit = BlocProvider.of<AuthCubit>(context);
    // if (isInitValue == false) {
    //   initValues(authCubit);
    // }
    final profileCubit = BlocProvider.of<ProfileCubit>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
      child: Form(
        key: _formKey,
        child: Column(children: [
          //
          InputFieldProfile(
            title: AppLocalizations.of(context)!.profile_name,
            isImportant: true,
            child: BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (pre, cur) => pre.name != cur.name,
              builder: (context, state) {
                return BaseTextField(
                    initialValue: state.name,
                    onChanged: (value) {
                      BlocProvider.of<ProfileCubit>(context)
                          .onUsernameChanged(value);
                    },
                    controller: null,
                    hintText: '');
              },
            ),
          ),
          SizedBox(height: 15.h),
          //
          InputFieldProfile(
            title: AppLocalizations.of(context)!.profile_email_address,
            child: BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (pre, cur) => pre.email != cur.email,
              builder: (context, state) {
                return BaseTextField(
                    initialValue: state.email,
                    readOnly: true,
                    onChanged: (value) {
                      BlocProvider.of<ProfileCubit>(context)
                          .onEmailChanged(value);
                    },
                    controller: null,
                    hintText: '');
              },
            ),
          ),
          SizedBox(height: 15.h),
          //
          InputFieldProfile(
            title: AppLocalizations.of(context)!.profile_country,
            isImportant: true,
            child: BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (pre, cur) => pre.country != cur.country,
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: greyBorderColor)),
                        child: CountryCodePicker(
                          onChanged: (value) {
                            if (value != null) {
                              BlocProvider.of<ProfileCubit>(context)
                                  .onCountryChanged(value.code!);
                            }
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: state.country,
                          // optional. Shows only country name and flag
                          showCountryOnly: true,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: true,
                          // optional. aligns the flag and the Text left
                          alignLeft: true,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 15.h),
          //
          InputFieldProfile(
            title: AppLocalizations.of(context)!.profile_phone,
            isImportant: true,
            child: BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (pre, cur) => pre.phone != cur.phone,
              builder: (context, state) {
                return BaseTextField(
                    initialValue: state.phone,
                    readOnly: true,
                    onChanged: (value) {
                      BlocProvider.of<ProfileCubit>(context)
                          .onPhoneChanged(value);
                    },
                    controller: null,
                    hintText: '');
              },
            ),
          ),
          SizedBox(height: 15.h),
          InputFieldProfile(
            title: AppLocalizations.of(context)!.profile_birthday,
            isImportant: true,
            child: BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (pre, cur) => pre.birthday != cur.birthday,
              builder: (context, state) {
                _txtBirthdayController.text = state.birthday;
                return BaseTextField(
                    onChanged: (value) {},
                    controller: _txtBirthdayController,
                    icon: IconButton(
                        onPressed: () {
                          Future<DateTime?> birthday = showDatePicker(
                            context: context,
                            initialDate: state.birthday != null
                                ? parseStringToDateTime(state.birthday)
                                : DateTime.now(),
                            firstDate: DateTime.utc(1900),
                            lastDate: DateTime.now(),
                            builder: (BuildContext context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  dialogTheme: DialogTheme(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16.0), // this is the border radius of the picker
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          birthday.then((value) {
                            if (value != null) {
                              setState(() {
                                _txtBirthdayController.text =
                                    formatYearMonthDayFromDateTime(value);
                              });
                              BlocProvider.of<ProfileCubit>(context)
                                  .onBirthdayChanged(
                                      formatYearMonthDayFromDateTime(value));
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.calendar_today,
                          size: 15,
                        )),
                    hintText: '');
              },
            ),
          ),
          SizedBox(height: 15.h),
          InputFieldProfile(
            title: AppLocalizations.of(context)!.profile_my_level,
            isImportant: true,
            child: BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (prev, cur) => prev.level != cur.level,
              builder: (context, state) {
                return DropdownButtonFormField2(
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select Your Level',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: levelItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: state.level,
                  onChanged: (value) {
                    //Do something when changing the item if you want.
                  },
                  onSaved: (value) {
                    BlocProvider.of<ProfileCubit>(context)
                        .onLevelChanged(value.toString());
                  },
                  buttonStyleData: const ButtonStyleData(
                    height: 60,
                    padding: EdgeInsets.only(left: 20, right: 10),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15.h),
          InputFieldProfile(
            title: AppLocalizations.of(context)!.profile_want_learn,
            isImportant: true,
            child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
              return SmartSelect<Specialities>.multiple(
                title: '',
                selectedValue: /*_selectedSpecialities*/
                    state.specialies ?? [],
                choiceItems: S2Choice.listFrom<Specialities, Specialities>(
                  source: specialitiesCutom,
                  value: (index, item) => item,
                  title: (index, item) => item.title,
                  group: (index, item) => item.group.toString(),
                ),
                onChange: (selected) => {
                  // setState(() => _selectedSpecialities = selected.value)
                  BlocProvider.of<ProfileCubit>(context)
                      .onSpecialitiesChanged(selected.value)
                },
                modalType: S2ModalType.bottomSheet,
                modalConfirm: true,
                modalFilter: true,
                choiceGrouped: true,
                tileBuilder: (context, state) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.all(5),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: S2Tile.fromState(
                      state,
                      hideValue: true,
                      trailing: const Icon(Icons.add_circle_outline),
                      body: S2TileChips(
                        chipLength: state.selected.length,
                        chipLabelBuilder: (context, i) {
                          return Text(state.selected.choice?[i].title ?? '');
                        },
                        chipOnDelete: (i) {
                          state.selected.value
                              .remove(state.selected.choice?[i].value);
                          BlocProvider.of<ProfileCubit>(context)
                              .onSpecialitiesChanged(state.selected.value);

                          // BlocProvider.of<ProfileCubit>(context)
                          //     .onSpecialitiesRemoved(state.selected.choice?[i].value);

                          // setState(() {
                          //   _selectedSpecialities
                          //       .remove(state.selected.choice?[i].value);
                          // });
                        },
                        chipColor: primaryColor,
                        chipRaised: true,
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 40.h,
              width: 130.w,
              child: LoadingButtonWidget(
                  submit: () {
                    profileCubit.onEditUserInformation();
                  },
                  isLoading: false,
                  label: AppLocalizations.of(context)!.save),
            ),
          )
        ]),
      ),
    );
  }
}
