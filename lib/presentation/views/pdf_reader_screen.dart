import 'package:flutter/material.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReaderScreen extends StatelessWidget {
  const PdfReaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r)),
        child: SfPdfViewer.network(
            'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'),
      ),
    );
  }
}
