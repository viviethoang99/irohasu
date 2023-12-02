import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  const Space(
    this.width,
    this.height, {
    super.key,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(width: width, height: height);
}

class VSpace extends StatelessWidget {
  const VSpace(this.size, {super.key});
  final double size;

  @override
  Widget build(BuildContext context) => Space(0, size);
}

class HSpace extends StatelessWidget {
  const HSpace(this.size, {super.key});
  final double size;

  @override
  Widget build(BuildContext context) => Space(size, 0);
}
