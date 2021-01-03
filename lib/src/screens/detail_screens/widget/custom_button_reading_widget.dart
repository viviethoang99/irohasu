import 'package:flutter/material.dart';

class CustomButtonReadingWidget extends StatelessWidget {
  CustomButtonReadingWidget({
    @required this.status,
    @required this.color,
    this.function,
  });

  final String status;
  final Object color;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      //Makes it usable on any background color
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white54, width: 2),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          onTap: () => function,
          child: Text(
            status,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
