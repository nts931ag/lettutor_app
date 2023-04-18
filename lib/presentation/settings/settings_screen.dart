import 'package:flutter/material.dart';
import 'package:lettutor_app/constant/const_value.dart';
import 'package:lettutor_app/presentation/commons/widgets/bottom_bar/bottom_bar_custom_widget.dart';
import 'package:lettutor_app/utils/resource/theme/text_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                Text(
                  "Account",
                  style: text18,
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
                MenuWidget(title: 'Account settings', callback: () {}),
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
                  style: text18,
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
                MenuWidget(title: 'Notifications', callback: () {}),
                MenuWidget(title: 'Language', callback: () {}),
                MenuWidget(title: 'Dark mode', callback: () {}),
                MenuWidget(title: 'Application information', callback: () {}),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Overview",
                  style: text18,
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
  const MenuWidget({super.key, required this.title, required this.callback});

  final String title;
  final VoidCallback callback;

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
          trailing: const Icon(Icons.navigate_next),
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
