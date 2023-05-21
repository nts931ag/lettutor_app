import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';
import 'package:lettutor_app/config/router/router.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:lettutor_app/presentation/widgets/commons/icon/circle_icon_widget.dart';
import 'package:lettutor_app/utils/resource/colors/colors_core.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool isDarkMode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isDarkMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // const HeaderProfile(),
                SizedBox(height: 35.h),
                Text(
                  "Account",
                  style: text18.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
                MenuWidget(
                    title: 'Edit Profile',
                    callback: () {
                      Navigator.pushNamed(context, MyRouter.profile);
                    }),
                MenuWidget(title: 'My wallet', callback: () {}),
                MenuWidget(
                    title: 'Become a tutor',
                    callback: () {
                      // TODO: Navigation to become Tutor
                      // Navigator.of(context).pushNamed(MyRouter.becomeTutor);
                    }),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Application",
                  style: text18.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
                MenuWidget(title: 'Notifications', callback: () {}),
                MenuWidget(
                    title: 'Language',
                    callback: () async {
                      await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: CircleIconWidget(
                                    backgroundColor: disableColor,
                                    borderColor: disableColor,
                                    padding: 10.w,
                                    onTap: () {},
                                    child: Assets.svg.common.iconVn.svg(),
                                  ),
                                  title: new Text("Tiếng Việt"),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: CircleIconWidget(
                                    backgroundColor: disableColor,
                                    borderColor: disableColor,
                                    padding: 10.w,
                                    onTap: () {},
                                    child: Assets.svg.common.iconUs.svg(),
                                  ),
                                  title: new Text("Tiếng Anh"),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    }),
                MenuWidget(
                  title: 'Dark mode',
                  callback: () {},
                  trailing: SwitchWidget(
                      isActive: isDarkMode,
                      callback: (value) {
                        setState(() {
                          isDarkMode = !isDarkMode;
                        });
                        // voiceProvider.enableAutoVoice(value);
                        // languageProvider.changeLocale(_locale);
                      }),
                ),
                MenuWidget(title: 'Application information', callback: () {}),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Overview",
                  style: text18.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
                MenuWidget(title: 'Privacy policies', callback: () {}),
                MenuWidget(title: 'Terms & conditions', callback: () {}),
                MenuWidget(title: 'Contact for support', callback: () {}),
                MenuWidget(title: 'FAQs', callback: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget(
      {super.key, required this.title, required this.callback, this.trailing});

  final String title;
  final VoidCallback callback;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            title,
          ),
          onTap: callback,
          contentPadding: EdgeInsets.fromLTRB(0, 2, 4, 2),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
          trailing: trailing ?? const Icon(Icons.navigate_next),
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key, required this.callback, this.isActive})
      : super(key: key);
  final callback;
  final isActive;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  // bool light = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // value: light,
      value: widget.isActive,
      onChanged: (bool value) {
        widget.callback(value);
        // setState(() {
        //   light = value;
        // });
      },
    );
  }
}
