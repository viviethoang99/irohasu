import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BottomBarChapterScreen extends StatefulWidget {
  const BottomBarChapterScreen({
    Key? key,
    this.countChapter,
    this.maxWidth,
    this.scrollController,
    this.getIndex,
    this.scrollListController,
  }) : super(key: key);

  final int? countChapter;
  final double? maxWidth;
  final int? getIndex;
  final ScrollController? scrollController;
  final ItemScrollController? scrollListController;

  @override
  _BottomBarChapterScreenState createState() => _BottomBarChapterScreenState();
}

class _BottomBarChapterScreenState extends State<BottomBarChapterScreen> {
  double _offset = 0.0, _delta = 0.0, _oldOffset = 0.0;
  final _containerMaxHeight = 56.0;

  bool hasReachedEnd = false;

  double? get maxWidth => widget.maxWidth;

  ScrollController? get _scrollController => widget.scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController!
      ..addListener(() {
        setState(() {
          final offset = _scrollController!.offset;
          _delta += (offset - _oldOffset);
          if (_delta > _containerMaxHeight) {
            _delta = _containerMaxHeight;
          } else if (_delta < 0) {
            _delta = 0;
          }
          _oldOffset = offset;
          _offset = -_delta;
        });
      })
      ..addListener(() {
        final maxScrollExtent = _scrollController!.position.maxScrollExtent;
        final currentScroll = _scrollController!.position.pixels;
        maxScrollExtent - currentScroll == 0
            ? hasReachedEnd = true
            : hasReachedEnd = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: hasReachedEnd ? 0 : _offset,
      width: maxWidth,
      child: Container(
        width: double.infinity,
        height: _containerMaxHeight,
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.skip_previous),
              color: Colors.black87,
              iconSize: 30,
              onPressed: widget.getIndex != 0 ? () {} : null,
            ),
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black87,
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: const Icon(Icons.view_list),
              color: Colors.black87,
              iconSize: 30,
              onPressed: () {
                Scaffold.of(context).openDrawer();
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  widget.scrollListController!
                      .jumpTo(index: widget.getIndex!, alignment: 0.5);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              color: Colors.black87,
              iconSize: 30,
              onPressed:
                  (widget.getIndex != widget.countChapter! - 1) ? () {} : null,
            ),
          ],
        ),
      ),
    );
  }
}
