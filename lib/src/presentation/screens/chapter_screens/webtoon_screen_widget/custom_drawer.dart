import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/helper/size_config.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required ItemScrollController? scrollListController,
    required int getIndex,
    required List getChapterList,
  })  : _scrollListController = scrollListController,
        _getIndex = getIndex,
        _getChapterList = getChapterList,
        super(key: key);

  final ItemScrollController? _scrollListController;
  final int _getIndex;
  final List _getChapterList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      width: SizeConfig.screenWidth * 0.65,
      height: SizeConfig.screenHeight,
      color: Colors.black87,
      child: ScrollablePositionedList.builder(
        itemScrollController: _scrollListController,
        itemCount: _getChapterList.length,
        itemBuilder: (context, index) {
          final item = _getChapterList[index];
          return ListTile(
            selected: (index == _getIndex),
            selectedTileColor: Colors.green,
            title: Text(
              item.title.toString(),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
