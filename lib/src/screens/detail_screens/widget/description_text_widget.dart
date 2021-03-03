import 'package:flutter/material.dart';
import '../../../../src/constants/base_content.dart';

class DescriptionTextWidget extends StatefulWidget {
  DescriptionTextWidget({@required this.text});

  final String text;

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget>
    with TickerProviderStateMixin {
  String get text => widget.text;

  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  Content.about,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              if (widget.text.length >= 100)
                flag
                    ? customButtonDescription(
                        status: 'Hiện', icon: Icons.keyboard_arrow_down)
                    : customButtonDescription(
                        status: 'Ẩn', icon: Icons.keyboard_arrow_up),
            ],
          ),
          AnimatedSize(
            curve: Curves.easeInSine,
            duration: const Duration(milliseconds: 300),
            vsync: this,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: showTextDescription(),
            ),
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
            border: Border.all(color: Theme.of(context).buttonColor, width: 2),
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
                Icon(icon, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  status,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
        ));
  }

  Widget showTextDescription() {
    return Container(
      child: flag
          ? Text(text,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 16,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis)
          : Text(
              text,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 16,
                  ),
            ),
    );
  }
}
