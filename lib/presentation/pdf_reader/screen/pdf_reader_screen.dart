import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_scaffold_widget.dart';
import 'package:lettutor_app/res/colors/colors_core.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReaderScreen extends StatelessWidget {
  const PdfReaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      appbar: AppBar(
        title: Text("Pdf view screen",
        style: text16,),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.find_in_page))
        ],
        backgroundColor: primaryColor,
      ),
      body: Container(
        child: SfPdfViewer.network(
            'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'),
      ),
    );
  }
}
