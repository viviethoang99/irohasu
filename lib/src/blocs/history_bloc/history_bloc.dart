import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

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
      ..sort(
          (a, b) => b.createTime.toString().compareTo(a.createTime.toString()));
    yield HistoryLoaded(data: listManga);
  }
}
