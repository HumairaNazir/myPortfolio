import 'package:flutter/material.dart';

import 'package:web/web.dart' as web;

class CvDownloadButton extends StatelessWidget {
  const CvDownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
        ),
        onPressed: () {
          const url = 'assets/Humaira_cv.pdf';

          final anchor =
              web.document.createElement('a') as web.HTMLAnchorElement
                ..href = url
                ..download = "Humaira_cv.pdf";
          anchor.click();
        },
        child: Text(
          "⬇ Download CV",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ));
  }
}
