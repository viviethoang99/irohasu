import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../helper/chap_helper.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial());

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if (event is FetchDataHistoryEvent) yield HistoryLoading();
    yield* _getListMangaHistory();
  }

  Stream<HistoryLoaded> _getListMangaHistory() async* {
    final listCache = Hive.box('irohasu').get('listManga', defaultValue: {});
    final listManga = await listCache.values
        .where((element) => element.data.listChapRead.isNotEmpty == true)
        .toList()
      ..sort((a, b) {
        final chapterA =
            ChapHelper.getChapterLastReading(a.data.idManga)!.timeReading;
        return ChapHelper.getChapterLastReading(b.data.idManga)!
            .timeReading
            .toString()
            .compareTo(chapterA.toString());
      });
    yield HistoryLoaded(data: listManga);
  }
}
