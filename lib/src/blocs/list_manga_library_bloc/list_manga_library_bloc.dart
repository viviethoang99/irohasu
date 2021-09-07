import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'list_manga_library_event.dart';

part 'list_manga_library_state.dart';

class ListMangaLibraryBloc
    extends Bloc<ListMangaLibraryEvent, ListMangaLibraryState> {
  ListMangaLibraryBloc() : super(ListMangaLibraryInitial());

  @override
  Stream<ListMangaLibraryState> mapEventToState(
    ListMangaLibraryEvent event,
  ) async* {
    if (event is FetchDataLibrary) {
      yield ListMangaLibraryLoading();
      yield* _getListMangaLibrary();
    }
  }

  Stream<ListMangaLibraryLoaded> _getListMangaLibrary() async* {
    final listCache = Hive.box('irohasu').get('listManga', defaultValue: {});
    final listManga = await listCache.values
        .where(
          (element) =>
              element.chapter.isFavorite == true ||
              element.chapter.listDownload.isNotEmpty,
        )
        .toList();
    yield ListMangaLibraryLoaded(listCache: listManga);
  }
}
