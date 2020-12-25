import 'package:flutter/material.dart';

class CustomButtonWidget extends StatefulWidget {
  @override
  _CustomButtonWidgetState createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  // final String status;
  // final Object icon;
  // final bool flag;
  //
  // CustomButtonWidget
  // ({@required this.status, @required this.icon, @required this.flag});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        //Makes it usable on any background color
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: InkWell(
            onTap: null,
            // onTap: () {
            //   setState(() {
            //     flag = !flag;
            //   });
            // },
            child: Row(
              children: <Widget>[
                const Icon(Icons.keyboard_arrow_down),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'More',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ));
  }
}
