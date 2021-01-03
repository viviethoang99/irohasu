import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../chapter_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
    @required ItemScrollController scrollListController,
    @required int getIndex,
    @required List getChapterList,
  })  : _scrollListController = scrollListController,
        _getIndex = getIndex,
        _getChapterList = getChapterList,
        super(key: key);

  final ItemScrollController _scrollListController;
  final int _getIndex;
  final List _getChapterList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      width: MediaQuery.of(context).size.width * 0.65,
      height: MediaQuery.of(context).size.height,
      color: Colors.black87,
      child: ScrollablePositionedList.builder(
        itemScrollController: _scrollListController,
        itemBuilder: (context, index) {
          return ListTile(
            selected: (index == _getIndex),
            selectedTileColor: Colors.green,
            title: Text(
              _getChapterList[index].chapterTitle.toString(),
              style: const TextStyle(fontSize: 17, color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                ChapterScreen.routeName,
                arguments: ChapterScreen(
                  endpoint: _getChapterList[index].chapterEndpoint.toString(),
                  chapterList: _getChapterList,
                ),
              );
            },
          );
        },
        itemCount: _getChapterList.length,
      ),
    );
  }
}
