import 'package:flutter/material.dart';

class BtnVoteWidget extends StatelessWidget {
  const BtnVoteWidget(
      {Key key, @required this.countLike, @required this.countDislike})
      : super(key: key);

  final String countDislike;
  final String countLike;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          const IconButton(
              icon: Icon(
                Icons.thumb_up,
                color: Colors.green,
              ),
              onPressed: null),
          Text(
            countLike,
            style: Theme.of(context).textTheme.bodyText1,
            ),
          const IconButton(
              icon: Icon(
                Icons.thumb_down,
                color: Colors.red,
              ),
              onPressed: null),
          Text(
            countDislike,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}