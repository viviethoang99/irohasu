import 'package:flutter/material.dart';

class CustomButtonReadingWidget extends StatelessWidget {
  final String status;
  final Object color;

  CustomButtonReadingWidget({
    @required this.status,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      //Makes it usable on any background color
      child: Ink(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          onTap: null,
          child: Text(
            status,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
