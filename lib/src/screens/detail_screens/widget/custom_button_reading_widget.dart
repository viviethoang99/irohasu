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
    return Material(
      type: MaterialType.transparency,
      //Makes it usable on any background color
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).buttonColor, width: 3),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: InkWell(
          onTap: () => openChap!(lastChapter),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            alignment: Alignment.center,
            child: Text(
              status.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).buttonColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
