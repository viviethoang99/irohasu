import 'package:flutter/material.dart';

class BtnSocialWidget extends StatelessWidget {
  const BtnSocialWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 10),
      child: Row(
        children: <Widget>[
          const IconButton(
            icon: Icon(
              Icons.cloud,
              color: Colors.green,
              size: 38,
            ),
            onPressed: null,
          ),
          const IconButton(
            icon: Icon(
              Icons.language,
              color: Colors.green,
              size: 38,
            ),
            onPressed: null,
          ),
          const IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.green,
              size: 38,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}