import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Thông báo'),
      content: const Text(
          'Chức năng này vẫn đang trong quá trình phát triền. '
              'Bạn hãy thử lại sau.'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
