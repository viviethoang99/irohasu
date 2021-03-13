import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../blocs/chapter_bloc/bloc.dart';
import '../../../service/history_data.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
    @required ItemScrollController scrollListController,
    @required int getIndex,
    @required List getChapterList,
    @required String idManga,
  })  : _scrollListController = scrollListController,
        _getIndex = getIndex,
        _getChapterList = getChapterList,
        _idManga = idManga,
        super(key: key);

  final ItemScrollController _scrollListController;
  final int _getIndex;
  final List _getChapterList;
  final String _idManga;

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
              HistoryData.addChapToHistory(
                idManga: _idManga,
                idChapter: _getChapterList[index].idChapter,
              );
              BlocProvider.of<ChapterBloc>(context)
                ..add(FetchDataChapterEvent(
                    endpoint: _getChapterList[index].chapterEndpoint));
            },
          );
        },
        itemCount: _getChapterList.length,
      ),
    );
  }
}
