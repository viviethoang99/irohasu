import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../models/chapter_item_model.dart';
import '../../service/download_data.dart';

part 'download_event.dart';

part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(DownloadInitialState());
  final _downloadData = DownloadData();
  Future<String> _path;
  bool isCancel = false;

  @override
  Stream<DownloadState> mapEventToState(DownloadEvent event) async* {
    if (event is DownloadChapterEvent) {
      yield DownloadingState();
      try {
        var uri = event.chapterModel.chapterEndpoint;
        var fileName = _downloadData.nameFolder(uri);
        _path = _downloadData.downloadChapter(
          uri: uri,
          name: fileName,
          folderName: event.titleManga,
          onProgress: (process) => add(ChapterDownloadPercentageChangedEvent(
            percentage: process,
            idChapter: event.chapterModel.idChapter,
            idManga: event.idManga,
          )),
        );
      } catch (e) {
        yield DownloadFailureState(msg: e);
      }
    }
    if (event is ChapterDownloadPercentageChangedEvent) {
      yield DownloadProcessState().copyWith(
        downloadPercentageCompleted: event.percentage,
      );
      if (event.percentage == 1) {
        print(await _path);
        var _isSuccess = await addChapToDownload(
          url: await _path,
          idManga: event.idManga,
          idChapter: event.idChapter,
        );
        yield _isSuccess ? DownloadedState(data: await _path) : null;
      }
    }
    if (event is RemoveDownloadChapterEvent) {
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
    url = await _downloadData.relativePathChapter(uri: url);

    try {
      listManga[idManga].data.listDownload.add(idChapter);
      listManga[idManga]
          .data
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
