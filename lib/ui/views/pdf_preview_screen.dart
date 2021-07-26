import 'package:aap_ki_amanat_aap_ki_sei/utils/colorResources.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
            title: Text('آپ کی خدمت میں ',style: TextStyle(
              fontSize: 18.0,
              color: ColorResources.COLOR_LANGUAGE,
              fontWeight: FontWeight.bold,
              fontFamily: '',
            )),
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: ColorResources.COLOR_LANGUAGE,
                onPressed: () async {
                  Navigator.of(context).pop();
                })),
        body: SfPdfViewer.asset('assets/urdu_book.pdf'));
  }
}
