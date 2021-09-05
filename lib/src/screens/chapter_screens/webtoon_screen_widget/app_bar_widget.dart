import 'package:equatable/equatable.dart';
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
  final double _containerMaxHeight = 70;

  double? get maxWidth => widget.maxWidth;

  ScrollController? get _scrollController => widget.scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController!.addListener(() {
      setState(() {
        var offset = _scrollController!.offset;
        _delta += (offset - _oldOffset);
        if (_delta > _containerMaxHeight) {
          _delta = _containerMaxHeight;
        } else if (_delta < 0) _delta = 0;
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
              iconSize: 39,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.bookmark),
              color: Colors.green[500],
              iconSize: 39,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.green[500],
              iconSize: 39,
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

class RadioGroup extends Equatable {
  RadioGroup({this.name, this.index});

  final String? name;
  final int? index;

  @override
  List<Object?> get props => [name, index];
}
