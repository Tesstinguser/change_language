import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import 'changelanguagepdf.dart';

class changelangugae extends StatefulWidget {

  final String name;
  final String address;
  changelangugae({super.key, required this.name, required this.address});
  @override
  State<changelangugae> createState() => _changelangugaeState();
}

class _changelangugaeState extends State<changelangugae> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('विजेन्द्र'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(widget.name, widget.address),
      ),
    );
  }
}
