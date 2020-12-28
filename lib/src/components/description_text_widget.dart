import 'dart:math';

import 'package:flutter/material.dart';

class DescriptionTextWidget extends StatefulWidget {
  DescriptionTextWidget({@required this.text});

  final String text;

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  bool flag = true;

  Widget showDescription() {
    return flag
        ? Text(
            widget.text,
            style: const TextStyle(color: Colors.white54, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        : Text(widget.text,
            style: const TextStyle(color: Colors.white54, fontSize: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Tóm tắt',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              flag
                  ? customButtonDescription(
                      status: 'More',
                      icon: Icons.keyboard_arrow_down,
                    )
                  : customButtonDescription(
                      status: 'Less',
                      icon: Icons.keyboard_arrow_up,
                    ),
            ],
          ),
          AnimatedContainer(
              duration: const Duration(milliseconds: 900),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              height: flag ? 60 : (widget.text.length / 50 * 18 + 75),
              child: showDescription()
          ),
        ],
      ),
    );
  }

  Widget customButtonDescription({String status, IconData icon}) {
    return Material(
        type: MaterialType.transparency,
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
            child: Row(
              children: <Widget>[
                Icon(icon, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  status,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }
}
