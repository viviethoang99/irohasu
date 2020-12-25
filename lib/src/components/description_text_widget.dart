import 'package:flutter/material.dart';

class DescriptionTextWidget extends StatefulWidget {
  DescriptionTextWidget({@required this.text});

  final String text;

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     const Text(
          //       'Tóm tắt',
          //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //     ),
          //     // flag
          //     //     ? CustomButtonWidget(
          //     //         status: 'More',
          //     //         icon: Icons.keyboard_arrow_down,
          //     //         flag: flag,
          //     //       )
          //     //     : CustomButtonWidget(
          //     //         status: 'Less',
          //     //         icon: Icons.keyboard_arrow_up,
          //     //         flag: flag,
          //     //       ),
          //   ],
          // ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: secondHalf.isEmpty
                ? Text(
                    firstHalf,
                    style: const TextStyle(color: Colors.white),
                  )
                : Column(
                    children: <Widget>[
                      Text(
                        flag ? ('$firstHalf  ...') : (firstHalf + secondHalf),
                        style: const TextStyle(color: Colors.white),
                      ),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              flag ? 'show more' : 'show less',
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
