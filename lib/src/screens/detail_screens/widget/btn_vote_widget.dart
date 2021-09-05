import 'package:flutter/material.dart';
import '../../../models/manga_detail_model.dart';

class BtnVoteWidget extends StatelessWidget {
  const BtnVoteWidget(
      {Key? key, required this.data})
      : super(key: key);

  final MangaDetailModel? data;

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
            data!.like!,
            style: Theme.of(context).textTheme.bodyText1,
            ),
          const IconButton(
              icon: Icon(
                Icons.thumb_down,
                color: Colors.red,
              ),
              onPressed: null),
          Text(
            data!.dislike!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}