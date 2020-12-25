import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiTest extends StatefulWidget {
  @override
  _UiTestState createState() => _UiTestState();
}

class _UiTestState extends State<UiTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('Goodbye World!'),),
      ),
    );
  }
}
