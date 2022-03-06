import 'package:flutter/material.dart';
import '../../setting_screen/widget/setting_chapter.dart';

class AppBarChapterScreen extends StatefulWidget {
  AppBarChapterScreen({this.maxWidth, this.scrollController});

  final double? maxWidth;
  final ScrollController? scrollController;

  @override
  _AppBarChapterScreenState createState() => _AppBarChapterScreenState();
}

class _AppBarChapterScreenState extends State<AppBarChapterScreen> {
  double _offset = 0, _delta = 0, _oldOffset = 0;

  double? get maxWidth => widget.maxWidth;

  ScrollController? get _scrollController => widget.scrollController;

  final _containerMaxHeight = 60.0;

  @override
  void initState() {
    super.initState();
    _scrollController!.addListener(() {
      setState(() {
        var offset = _scrollController!.offset;
        _delta += (offset - _oldOffset);
        if (_delta > _containerMaxHeight) {
          _delta = _containerMaxHeight;
        } else if (_delta < 0) {
          _delta = 0;
        }
        _oldOffset = offset;
        _offset = -_delta;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _offset,
      width: maxWidth,
      child: Container(
        width: double.infinity,
        height: _containerMaxHeight,
        color: Colors.black54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.comment),
              color: Colors.green[500],
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.bookmark),
              color: Colors.green[500],
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.green[500],
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pushNamed(SettingChapter.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}