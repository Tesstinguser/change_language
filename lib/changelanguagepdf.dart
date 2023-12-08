import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> makePdf(String name, String address) async {
  final pdf = Document();
  final hindifonts = await rootBundle.load("fonts/hindi.ttf");
  final gujaratiFont = await rootBundle.load("fonts/gujarati.ttf");

  final hindittf = pw.Font.ttf(hindifonts);
  final gujaratiTtf = pw.Font.ttf(gujaratiFont);

    // String language;
    // pw.Font font;
    //
    // if (name.contains(RegExp(r'[^\x00-\x7F]'))) {
    //   // Contains non-ASCII characters, assuming it's Gujarati
    //   language = 'Gujarati';
    //   font = gujaratiTtf;
    // }
    // else if (name.contains(RegExp(r'[\u0900-\u097F]'))) {
    //   // Contains Devanagari characters, assuming it's Hindi
    //   language = 'Hindi';
    //   font = hindittf;
    // }
    // else {
    //   // Invalid language
    //   language = 'Invalid language';
    //   font = pw.Font.ttf(hindifonts); // Use Hindi font for displaying the error message
    //
    // }
  String language;
  pw.Font font;

  // Your custom logic for detecting Hindi and Gujarati languages
  if (name.contains(RegExp(r'[અ-઺ા-ૅે-ૉૌ-્ૐંઃ]'))) {
    // Contains Gujarati characters
    language = 'Gujarati';
    font = gujaratiTtf;
  }
  else if (name.contains(RegExp(r'[\u0900-\u097F]'))) {
    // Contains Hindi characters
    language = 'Hindi';
    font = hindittf;
  }
  else {
    // Invalid language
    language = 'Invalid language';
    font = pw.Font.ttf(hindifonts); // Use Hindi font for displaying the error message
  }

  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
           pw.Text(
              name,
              style: pw.TextStyle(font: font, fontSize: 20),
            ),

              pw.Text("विजेन्द्र",style: pw.TextStyle(font: font, fontSize: 20),),
            // pw.Text("વિજેન્દ્ર",style: pw.TextStyle(font: font, fontSize: 20),),
          ],
        );
      },
    ),
  );

  return pdf.save();
}

Widget PaddedText(
    final String text, {
      final TextAlign align = TextAlign.left,
    }) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );


// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:pdf/widgets.dart' as pw;
//
// Future<Uint8List> makePdf(String name, String address) async {
//   final pdf = Document();
//   final hindifonts = await rootBundle.load("fonts/hindi.ttf");
//   final gujaratiFont = await rootBundle.load("fonts/gujarati.ttf");
//   //
//   final hindittf = pw.Font.ttf(hindifonts);
//   final gujaratiTtf = pw.Font.ttf(gujaratiFont);
//
//   // final ttf = pw.Font.ttf(gujaratifonts);
//
//
//   pdf.addPage(
//     Page(
//       build: (context) {
//         return Column(
//          children: [
//            Text(name,style: pw.TextStyle(font:  hindittf, fontSize: 20),),
//
//
//              //
//              // Text((gujaratiTtf == 'gujarati') ? name : (hindittf == 'hindi') ? name : 'Invalid language',
//              //   style: TextStyle(fontSize: 20),
//              // ),
//
//
//
//
//
//            // Text(address,style: pw.TextStyle(font:  gujaratiTtf, fontSize: 20),),
//            // Text("आपका टेक्स्ट",style: pw.TextStyle(font:  hindittf, fontSize: 20),),
//            // Text("ગુજરાતી",style: pw.TextStyle(font:  gujaratiTtf, fontSize: 20),),
//
//          //
//
//          ]
//         );
//       },
//     ),
//   );
//
//   return pdf.save();
// }
// Widget PaddedText(
//     final String text, {
//       final TextAlign align = TextAlign.left,
//     }) =>
//     Padding(
//       padding: EdgeInsets.all(10),
//       child: Text(
//         text,
//         textAlign: align,
//       ),
//     );
