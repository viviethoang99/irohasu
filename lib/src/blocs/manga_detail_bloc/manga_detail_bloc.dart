import 'package:flutter_bloc/flutter_bloc.dart';

import '../../local/cache_manager_data.dart';
import '../../models/chapter_item_model.dart';
import '../../models/manga_detail_model.dart';
import '../../repositories/manga_repository.dart';
import 'bloc.dart';

class MangaDetailBloc extends Bloc<MangaDetailEvent, MangaDetailState> {
  MangaDetailBloc(this.repository, this.cacheManagerData)
      : super(InitialMangaDetailState());

  final MangaRepository repository;
  final CacheManagerData cacheManagerData;

  @override
  Stream<MangaDetailState> mapEventToState(MangaDetailEvent event) async* {
    if (event is FetchMangaDetailEvent) {
      yield MangaDetailLoadingState();
      try {
        final data = await repository.fetchDataMangaDetail(event.endpoint!);
        if (data != null) {
          yield MangaDetailLoadedState(data: data);
          // yield* _loadDataListManga(data: data);
        } else {
          final idManga = event.endpoint!.split('/')[4];
          final cache = await (cacheManagerData.getMangaRequestData(idManga));
          yield MangaDetailLoadedState(data: cache!.data);
        }
      } catch (e) {
        yield MangaDetailFailureState(msg: e.toString());
      }
    }
    if (event is AddChapterToListReading) {
      yield MangaDetailLoadingState();
      try {
        final item = await cacheManagerData.getMangaRequestData(event.idManga);
        yield MangaDetailLoadedState(data: item!.data);
      } catch (e) {
        print(e);
        yield MangaDetailFailureState(msg: e.toString());
      }
    }
  }

  Stream<MangaDetailSyncState> _loadDataListManga(
      {required MangaDetailModel data}) async* {
    final _manga = await cacheManagerData.getMangaRequestData(data.idManga);

    if (_manga != null) {
      final listManga = await syncDataListChapter(
        fetchData: data.listChapter!,
        dataCache: _manga.data.listChapter!,
      );
      _manga.data.copyWith(
        listGenres: data.listGenres,
        listChapter: listManga,
      );
    }
    yield MangaDetailSyncState(data: _manga?.data ?? data);
  }

  /*
  Input:
  -  fetchData is list chapter get from the server
  -  dataCache is list chapter get from database Irohasu
  Output:
  -  Returns the data displayed on the screen.
  Process:
  -  Synchronize retrieved data with the database Irohasu.
  -  If equatable length chapter database => return data database.
  -  Else assign a value to the chapter fetch data if they are equatable.
   */
  Future<List<ChapterItem>?> syncDataListChapter({
    required List<ChapterItem> fetchData,
    required List<ChapterItem> dataCache,
  }) async {
    var resultList = <ChapterItem>[];
    if (fetchData.length != dataCache.length) {
      resultList = fetchData.map((ChapterItem manga) {
        for (var cache in dataCache) {
          if (manga == cache) return cache;
        }
        return manga;
      }).toList();
    } else {
      return dataCache;
    }
    return resultList;
  }
}
