import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(aaaaaaaaa());
}

class aaaaaaaaa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PdfScreen(),
    );
  }
}

class PdfScreen extends StatefulWidget {
  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  Future<void> _generatePdfAndView() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
                'यह हिंदी में टेक्स्ट है।',
                // style: pw.TextStyle(font: pw.Font.ttf((await _loadFont()) as ByteData)),
          ),
          );
        },
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/example.pdf';
    final file = await File(path).writeAsBytes(await pdf.save());

    // Navigate to the PDF viewer screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('PDF Viewer'),
          ),
          body: SfPdfViewer.file(File(path)),
        ),
      ),
    );
  }

  Future<Uint8List> _loadFont() async {
    final fontData = await rootBundle.load('fonts/hindi.ttf');
    return fontData.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _generatePdfAndView,
          child: Text('Generate PDF'),
        ),
      ),
    );
  }
}
