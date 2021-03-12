import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irohasu/src/blocs/manga_detail_bloc/bloc.dart';

import '../../../blocs/download_bloc/download_bloc.dart';
import '../../../helper/convert_date_time.dart';
import '../../../models/chapter_item_model.dart';
import '../../../models/manga_detail_model.dart';
import '../../../service/history_data.dart';
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

  final Duration transitionDuration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${data.listChapter.length} Chương',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: _isReversed
                    ? Icon(Icons.swap_vertical_circle,
                        color: Theme.of(context).buttonColor, size: 26)
                    : Icon(Icons.swap_vert,
                        color: Theme.of(context).primaryColor, size: 26),
                onPressed: () {
                  setState(() => _isReversed = !_isReversed);
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
    final theme = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView.separated(
          reverse: _isReversed,
          separatorBuilder: (context, index) =>
              Divider(color: theme.canvasColor),
          shrinkWrap: true,
          itemCount: data.listChapter.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            final chapter = data.listChapter[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 5,
              ),
              dense: true,
              title: Container(
                child: Text(
                  chapter.chapterTitle.toString(),
                  style: chapter.isReading
                      ? theme.textTheme.subtitle1.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                      : TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                ),
              ),
              subtitle: Text(
                ConvertDateTime.dateTimeToString(chapter.chapterUpload),
                style: theme.textTheme.subtitle1.copyWith(fontSize: 18),
              ),
              trailing: btnDownload(
                item: chapter,
                index: index,
              ),
              isThreeLine: true,
              onTap: () => openChapter(
                idChapter: chapter.idChapter,
                chapterEndpoint: chapter.chapterEndpoint,
              ),
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
                  BlocProvider.of<DownloadBloc>(context).add(
                    RemoveDownloadChapterEvent(
                      chapter: item,
                      idManga: data.idManga,
                    ),
                  );
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
                  BlocProvider.of<DownloadBloc>(context).add(
                      DownloadChapterEvent(
                          chapterModel: item,
                          titleManga: data.title,
                          idManga: data.idManga));
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

  void openChapter({String idChapter, String chapterEndpoint}) {
    HistoryData.addChapToHistory(
      idManga: data.idManga,
      idChapter: idChapter,
    );
    BlocProvider.of<MangaDetailBloc>(context)
        .add(AddChapterToListReading(data.idManga));
    Navigator.of(context).pushNamed(
      ChapterScreen.routeName,
      arguments: ChapterScreen(
          endpoint: chapterEndpoint, chapterList: data.listChapter),
    );
  }
}
