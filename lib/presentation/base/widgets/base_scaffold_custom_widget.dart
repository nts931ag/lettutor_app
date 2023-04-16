// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/commons/widgets/app_bar/main_app_bar_widget.dart';
import 'package:lettutor_app/resource/dimens.dart';

class BaseScaffoldWidgetCustom extends StatelessWidget {
  final Widget body;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? background;
  final Color? backgroundChild;
  final bool resizeToAvoidBottomInset;
  final bool isPaddingDefault;
  final bool isBaseDrawer;
  final PreferredSizeWidget? appbar;
  final EdgeInsetsGeometry? marginCustom;
  final EdgeInsetsGeometry? paddingCustom;
  final List<Widget> actions;
  const BaseScaffoldWidgetCustom(
      {Key? key,
        required this.body,
        this.bottomSheet,
        this.bottomNavigationBar,
        this.floatingActionButton,
        this.background,
        this.backgroundChild,
        this.resizeToAvoidBottomInset = false,
        this.isPaddingDefault = true,
        this.isBaseDrawer = true,
        this.appbar,
        this.marginCustom,
        this.paddingCustom,
        this.actions = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: background,
        body: isPaddingDefault
            ? Container(
          margin: marginCustom,
          padding:
          paddingCustom ?? EdgeInsets.symmetric(horizontal: 20.w),
          child: body,
        )
            : body,
        bottomSheet: bottomSheet,
        bottomNavigationBar: bottomNavigationBar,
        appBar: appbar ??
            MainAppBar(actions: actions),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}


