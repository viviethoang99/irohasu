import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

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

  List<ChapterItem> _chapterIsRead = [];

  bool _isReading;

  final mangaBox = Hive.box<MangaModel>(MangaModel.mangaBox);

  @override
  void initState() {
    super.initState();
    _isReading = mangaBox.containsKey(_idManga);
    _getChapterIsRead();
  }

  Future<void> _getChapterIsRead() async {
    _isReading = mangaBox.containsKey(_idManga);
    if (_isReading)
      _chapterIsRead = mangaBox.get(_idManga).listChapRead.toList();
  }

  Future<void> setChapterRead(ChapterItem item) async {
    mangaBox.get(_idManga).listChapRead.add(item);
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
          valueListenable: mangaBox.listenable(keys: <String>[_idManga]),
          builder: (context, Box<MangaModel> _box, _) {
            return ListView.separated(
              reverse: _isReversed,
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(color: Theme.of(context).canvasColor),
              shrinkWrap: true,
              itemCount: widget.data.listChapter.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                var status = true;
                if (_isReading)
                  status = _box
                      .get(_idManga)
                      .listChapRead
                      .toList()
                      ?.where((chapter) => chapter == _listChapter[index])
                      ?.isEmpty;
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
                    setChapterRead(widget.data.listChapter[index]);
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

  String dateTimeToString(dynamic date) {
    return DateFormat('dd/MM/yyyy hh:mm').format(date as DateTime);
  }
}
