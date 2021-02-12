import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:irohasu/src/service/history_data.dart';

import '../../../models/chapter_item_model.dart';
import '../../../models/manga_model.dart';
import '../../chapter_screens/chapter_screen.dart';

class ListChapterWidget extends StatefulWidget {
  const ListChapterWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final MangaModel data;

  @override
  _ListChapterWidgetState createState() => _ListChapterWidgetState();
}

class _ListChapterWidgetState extends State<ListChapterWidget> {
  bool _isReversed = false;

  String get _idManga => widget.data.idManga;

  List<ChapterItem> get _listChapter => widget.data.listChapter.toList();

  List<ChapterItem> _chapterIsRead;

  int _indexList;

  final mangaBox = Hive.box('irohasu');

  @override
  void initState() {
    super.initState();
    _getChapterIsRead();
  }

  void _getChapterIsRead() {
    List listManga = (mangaBox.get('listManga', defaultValue: []));
    _indexList = listManga.indexWhere((manga) => manga.idManga == _idManga);
    _chapterIsRead = _indexList != -1 ? listManga[_indexList].listChapRead : [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${widget.data.listChapter.length} Chapters',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: _isReversed
                    ? Icon(Icons.swap_vertical_circle,
                        color: Theme.of(context).buttonColor, size: 26)
                    : Icon(Icons.swap_vert,
                        color: Theme.of(context).primaryColor, size: 26),
                onPressed: () {
                  setState(() {
                    _isReversed = !_isReversed;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(color: Theme.of(context).buttonColor, height: 4)),
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: loadListChapter(),
        ),
      ],
    );
  }

  Widget loadListChapter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ValueListenableBuilder(
          valueListenable: mangaBox.listenable(),
          builder: (context, Box _box, _) {
            return ListView.separated(
              reverse: _isReversed,
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(color: Theme.of(context).canvasColor),
              shrinkWrap: true,
              itemCount: widget.data.listChapter.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                var status = true;
                if (_chapterIsRead.isNotEmpty) {
                  List listManga = mangaBox.get('listManga');
                  status = listManga[_indexList]
                      ?.listChapRead
                      ?.where((chapter) => chapter == _listChapter[index])
                      ?.isEmpty;
                }
                return ListTile(
                  dense: true,
                  title: Text(
                    widget.data.listChapter[index].chapterTitle.toString(),
                    style: status
                        ? TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                        : Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    dateTimeToString(
                        widget.data.listChapter[index].chapterUpload),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: Icon(
                    Icons.arrow_circle_down,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  isThreeLine: true,
                  onTap: () {
                    if (status)
                      HistoryData.addChapToHistory(widget.data, _indexList,
                          widget.data.listChapter[index]);
                    Navigator.of(context).pushNamed(
                      ChapterScreen.routeName,
                      arguments: ChapterScreen(
                        endpoint: widget.data.listChapter[index].chapterEndpoint
                            .toString(),
                        chapterList: widget.data.listChapter,
                      ),
                    );
                  },
                );
              },
            );
          }),
    );
  }

  String dateConverter(String date) {
    // Input date Format
    final format = DateFormat('dd/MM/yyyy hh:mm');
    var gettingDate = format.parse(date);
    final formatter = DateFormat('yyyy-MM-dd');
    // Output Date Format
    final formatted = formatter.format(gettingDate);
    return date;
  }

  String dateTimeToString(DateTime date) {
    return DateFormat('dd/MM/yyyy hh:mm').format(date);
  }
}
