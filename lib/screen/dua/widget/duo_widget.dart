import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:zikr_uz/utils/my_utils.dart';

class DuoWidget extends StatelessWidget {
  final PdfViewerController pdfViewerController;
  const DuoWidget({super.key, required this.pdfViewerController});

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.asset(
    canShowScrollHead:true,
    pageSpacing:0,
    'assets/pdf/duolar.pdf',
    controller: pdfViewerController,
    currentSearchTextHighlightColor: Colors.yellow.withOpacity(0.6),
    otherSearchTextHighlightColor: Colors.yellow.withOpacity(0.3),
    );
  }
}