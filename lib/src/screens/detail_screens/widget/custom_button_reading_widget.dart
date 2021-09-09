import 'package:flutter/material.dart';
import '../../../models/chapter_item_model.dart';

class CustomButtonReadingWidget extends StatelessWidget {
  CustomButtonReadingWidget({
    required this.status,
    required this.lastChapter,
    this.openChap,
  });

  final String status;
  final ChapterItem lastChapter;
  final Function? openChap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.teal,
        onSurface: Colors.red,
        side: BorderSide(
          color: Theme.of(context).buttonColor,
          width: 3,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
      onPressed: () {
        openChap!(lastChapter);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Text(
          status.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Theme.of(context).buttonColor,
          ),
        ),
      ),
    );
  }
}
