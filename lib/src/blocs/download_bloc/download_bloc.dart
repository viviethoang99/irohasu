import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:irohasu/src/models/chapter_item_model.dart';

import '../../service/download_data.dart';

part 'download_event.dart';

part 'download_state.dart';

typedef DownloadPercentageChanged = void Function(double percentage);

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(DownloadInitialState());
  final _downloadData = DownloadData();
  Future<String> _path;
  bool isCancel = false;

  @override
  Stream<DownloadState> mapEventToState(DownloadEvent event) async* {
    if (event is DownloadChapterEvent) {
      try {
        yield DownloadingState();
        var uri = event.chapterModel.chapterEndpoint;
        var fileName = _downloadData.nameFolder(uri);
        _path = _downloadData.downloadChapter(
          uri: uri,
          name: fileName,
          folderName: event.titleManga,
          onProgress: (double process) =>
              add(ChapterDownloadPercentageChangedEvent(
            percentage: process,
            idChapter: event.chapterModel.idChapter,
            idManga: event.idManga,
          )),
        );
      } catch (e) {
        print(e);
      }
    }
    if (event is ChapterDownloadPercentageChangedEvent) {
      yield DownloadProcessState()
          .copyWith(downloadPercentageCompleted: event.percentage);
      if (event.percentage == 1) {
        String uriChapter;
        // print(uriChapter);
        await _path.then((String value) {
          uriChapter = value;
        });
        print(uriChapter);
        var _isSuccess = await addChapToDownload(
          url: uriChapter,
          idManga: event.idManga,
          idChapter: event.idChapter,
        );
        yield _isSuccess ? DownloadedState(data: uriChapter) : null;
      }
    }
    if (event is RemoveChapterEvent) {
      yield DownloadingState();
      var urlDownload = event?.chapter?.isDownload;
      if (urlDownload != null) {
        try {
          var _isRemove = await _downloadData.removeFolder(url: urlDownload);
          if (_isRemove)
            await removeChapToDownload(idChapter: event.chapter.idChapter);
          yield DownloadInitialState();
        } catch (e) {
          print(e);
        }
      }
    }
  }

  Future<bool> removeChapToDownload({String idChapter, int indexManga}) async {
    var mangaBox = Hive.box('irohasu');
    var listManga = mangaBox.get('listManga', defaultValue: {});

    try {
      var listDownload = listManga[indexManga]
          .listDownload
          .where((id) => id != idChapter)
          .toList();
      listManga[indexManga].listDownload = listDownload;
      listManga[indexManga]
          .listChapter
          .firstWhere((manga) => manga.idChapter == idChapter)
          .isDownload = null;
      await mangaBox.put('listManga', listManga);
      return true;
    } catch (_) {
      // throw Exception('Error on remove Manga download to database');
      return false;
    }
  }

  Future<bool> addChapToDownload({
    String idManga,
    String idChapter,
    String url,
  }) async {
    var mangaBox = Hive.box('irohasu');
    var listManga = mangaBox.get('listManga', defaultValue: {});
    // print('Before: $url');
    url = await _downloadData.relativePathChapter(uri: url);
    // print('Local chapter: $url');

    try {
      listManga[idManga].data.listDownload.add(idChapter);
      listManga[idManga].data
          .listChapter
          .firstWhere((manga) => manga.idChapter == idChapter)
          .isDownload = url;
      await mangaBox.put('listManga', listManga);
      return true;
    } catch (_) {
      return false;
      // throw Exception('Error on add Manga download to database');
    }
  }
}
