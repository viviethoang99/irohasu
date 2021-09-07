import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../helper/media_query_helper.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required ItemScrollController? scrollListController,
    required int getIndex,
    required List getChapterList,
    required this.openChapter,
  })  : _scrollListController = scrollListController,
        _getIndex = getIndex,
        _getChapterList = getChapterList,
        super(key: key);

  final ItemScrollController? _scrollListController;
  final int _getIndex;
  final List _getChapterList;
  final Function openChapter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      width: ScreenHelper.getWidth(context) * 0.65,
      height: ScreenHelper.getHeight(context),
      color: Colors.black87,
      child: ScrollablePositionedList.builder(
        itemScrollController: _scrollListController,
        itemBuilder: (context, index) {
          final item = _getChapterList[index];
          return ListTile(
            selected: (index == _getIndex),
            selectedTileColor: Colors.green,
            title: Text(
              item.title.toString(),
              style: const TextStyle(fontSize: 17, color: Colors.white),
            ),
            onTap: () => openChapter(index),
          );
        },
        itemCount: _getChapterList.length,
      ),
    );
  }
}
