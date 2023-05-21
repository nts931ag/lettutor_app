import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/widgets/base/base_scaffold_custom_widget.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: BaseScaffoldWidgetCustom(body: SingleChildScrollView()));
  }
}
