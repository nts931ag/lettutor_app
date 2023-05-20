import 'package:flutter/material.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReaderScreen extends StatefulWidget {
  const PdfReaderScreen({Key? key, required this.nameFile, required this.name, })
      : super(key: key);
  final String nameFile;
  final String name;

  @override
  State<PdfReaderScreen> createState() => _PdfReaderScreenState();
}

class _PdfReaderScreenState extends State<PdfReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: PreferredSize(
            //   preferredSize: Size.fromHeight(70.h),
            //   child: CustomAppBar(
            //       appBarName: widget.nameFile,
            //       backgroundColor: Colors.transparent),
            // ),
            appBar: AppBar(
              title: Text(
                widget.name,
                style: text14,
              ),
            ),
            body: SfPdfViewer.network(widget.nameFile)));
  }
}
