import 'package:flutter/material.dart';

class IrohaDecoration {
  static Decoration decoration(
    Color boxColor,
    Color boxShadow, {
    double spreadRadius = 0,
    double blurRadius = 20,
    Offset offset = Offset.zero,
    BoxBorder? border,
  }) {
    return BoxDecoration(
      color: boxColor,
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      border: border,
      boxShadow: [
        BoxShadow(
          color: boxShadow,
          spreadRadius: spreadRadius,
          blurRadius: blurRadius,
          offset: offset,
        ),
      ],
    );
  }
}
