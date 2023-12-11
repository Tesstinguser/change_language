import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<void> generatePDF() async {
  final pdf = pw.Document();

  // Create a page
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text(
            'यह हिंदी में टेक्स्ट है।', // Hindi text here
            style: pw.TextStyle(fontSize: 24),
            textAlign: pw.TextAlign.center,
          ),
        );
      },
    ),
  );

  // Get the device's temporary directory
  final output = await getTemporaryDirectory();
  final pdfFile = File('${output.path}/hindi_text.pdf');

  // Save the PDF to a file
  await pdfFile.writeAsBytes(await pdf.save());
  print('PDF Generated');

  // Here, you can use the generated PDF file as needed (e.g., share, display, etc.)
}
