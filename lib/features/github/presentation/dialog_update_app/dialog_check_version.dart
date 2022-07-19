import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


class DialogCheckUpdateApp extends StatelessWidget {
  const DialogCheckUpdateApp({
    Key? key,
    required this.content,
    required this.tagName,
  }) : super(key: key);

  final String tagName;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        'Phiên bản $tagName',
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 300,
        width: 300,
        child: MarkdownBody(
          data: content,
          shrinkWrap: true,
        ),
      ),
      actions: <Widget>[
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Thoát'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Tải xuống'),
              ),
            )
          ],
        )
      ],
    );
  }
}
