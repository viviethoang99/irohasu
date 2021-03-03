import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:irohasu/src/blocs/download_bloc/download_bloc.dart';
import 'package:irohasu/src/models/chapter_item_model.dart';
import 'package:irohasu/src/service/history_data.dart';
import 'package:irohasu/src/service/hive_data_manga.dart';

import '../../../models/manga_detail_model.dart';
import '../../chapter_screens/chapter_screen.dart';

class ListChapterWidget extends StatefulWidget {
  const ListChapterWidget({Key key, @required this.data}) : super(key: key);

  final MangaDetailModel data;

  @override
  _ListChapterWidgetState createState() => _ListChapterWidgetState();
}

class _ListChapterWidgetState extends State<ListChapterWidget> {
  bool _isReversed = false;

  MangaDetailModel get data => widget.data;

  int _indexManga;
  final Duration transitionDuration = const Duration(milliseconds: 500);
  final _saveDatabase = HiveDataManga();

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
                '${data.listChapter.length} Chương',
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
        child: ListView.separated(
          reverse: _isReversed,
          separatorBuilder: (BuildContext context, int index) =>
              Divider(color: Theme.of(context).canvasColor),
          shrinkWrap: true,
          itemCount: data.listChapter.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              dense: true,
              title: Text(
                data.listChapter[index].chapterTitle.toString(),
                style: data.listChapter[index].isReading
                    ? Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )
                    : TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                dateTimeToString(data.listChapter[index].chapterUpload),
                style: Theme.of(context).textTheme.subtitle1,
              ),
              trailing: btnDownload(
                item: data.listChapter[index],
                index: index,
              ),
              // trailing: DownloadButton(
              //   index: index,
              //   data: data,
              //   item: data.listChapter[index],
              // ),
              isThreeLine: true,
              onTap: () {
                if (!data.listChapter[index].isReading)
                  HistoryData.addChapToHistory(
                      data, index, data.listChapter[index].idChapter);
                Navigator.of(context).pushNamed(
                  ChapterScreen.routeName,
                  arguments: ChapterScreen(
                    endpoint:
                        data.listChapter[index].chapterEndpoint.toString(),
                    chapterList: data.listChapter,
                  ),
                );
              },
            );
          },
        ));
  }

  Widget btnDownload({ChapterItem item, int index}) {
    return BlocProvider(
      create: (_) => DownloadBloc(),
      child: BlocBuilder<DownloadBloc, DownloadState>(
        builder: (BuildContext context, state) {
          if (state is DownloadedState || item.isDownload != null) {
            return IconButton(
                icon: Icon(
                  Icons.offline_pin_rounded,
                  size: 37,
                  color: Theme.of(context).buttonColor,
                ),
                onPressed: () {
                  BlocProvider.of<DownloadBloc>(context).add(RemoveChapterEvent(
                      chapter: item, indexManga: _indexManga));
                });
          }
          if (state is DownloadingState) {
            // if (index%0 == 2) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 29,
                width: 29,
                child: AnimatedOpacity(
                  duration: transitionDuration,
                  opacity: 0.0,
                  curve: Curves.ease,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).buttonColor),
                    ),
                  ),
                ),
              ),
            );
          }
          if (state is DownloadInitialState && item.isDownload == null) {
            return IconButton(
                icon: Icon(
                  Icons.arrow_circle_down,
                  size: 37,
                  color: Theme.of(context).buttonColor,
                ),
                onPressed: () async {
                  _indexManga = await _saveDatabase.addMangaToDatabase(
                    data: data,
                  );
                  BlocProvider.of<DownloadBloc>(context).add(
                      DownloadChapterEvent(
                          chapterModel: item,
                          titleManga: data.title,
                          indexManga: _indexManga));
                });
          }
          if (state is DownloadProcessState) {
            // print('Download is ${state.downloadPercentageCompleted * 100}%');
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 29,
                width: 29,
                child: AnimatedOpacity(
                  duration: transitionDuration,
                  opacity: 1.0,
                  curve: Curves.ease,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<DownloadBloc>(context).add(
                            CancelDownloadEvent(idChapter: item.idChapter));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            backgroundColor: Colors.white.withOpacity(0.0),
                            value: state.downloadPercentageCompleted,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).buttonColor),
                          ),
                          const Icon(
                            Icons.stop,
                            size: 18,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  // String dateConverter(String date) {
  //   // Input date Format
  //   final format = DateFormat('dd/MM/yyyy hh:mm');
  //   var gettingDate = format.parse(date);
  //   final formatter = DateFormat('yyyy-MM-dd');
  //   // Output Date Format
  //   final formatted = formatter.format(gettingDate);
  //   return date;
  // }

  String dateTimeToString(DateTime date) {
    return DateFormat('dd/MM/yyyy hh:mm').format(date);
  }
}
