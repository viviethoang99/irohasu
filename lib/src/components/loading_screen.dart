import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
