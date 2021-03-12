import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/chapter_item_model.dart';
import '../../models/manga_detail_model.dart';
import '../../resources/manga_detail_repo.dart';
import '../../service/cache_manager_data.dart';
import 'bloc.dart';

class MangaDetailBloc extends Bloc<MangaDetailEvent, MangaDetailState> {
  MangaDetailBloc(this._detailRepo) : super(InitialMangaDetailState());
  final MangaDetailRepo _detailRepo;
  final _cacheManagerData = CacheManagerData();

  @override
  Stream<MangaDetailState> mapEventToState(MangaDetailEvent event) async* {
    if (event is FetchMangaDetailEvent) {
      yield MangaDetailLoadingState();
      try {
        final data = await _detailRepo.fetchMangaDetail(event.endpoint);
        yield MangaDetailLoadedState(data: data);
        yield* loadDataListManga(data: data);
      } catch (e) {
        yield MangaDetailFailureState(msg: e.toString());
      }
    }
    if (event is AddChapterToListReading) {
      yield MangaDetailLoadingState();
      try {
        final item = await CacheManagerData().
            getMangaRequestData(event.idManga);
        yield MangaDetailLoadedState(data: item.data);
      } catch (e) {
        print(e);
        yield MangaDetailFailureState(msg: e.toString());
      }
    }
  }

  Stream<MangaDetailSyncState> loadDataListManga(
      {MangaDetailModel data}) async* {
    var _manga = await _cacheManagerData.getMangaRequestData(data.idManga);
    if (_manga != null) {
      _manga.data
        ..listGenres = data.listGenres
        ..listChapter = await syncDataListChapter(
          fetchData: data.listChapter,
          dataCache: _manga.data.listChapter,
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
  Future<List<ChapterItem>> syncDataListChapter({
    List<ChapterItem> fetchData,
    List<ChapterItem> dataCache,
  }) async {
    if (dataCache.length != dataCache.length) {
      fetchData.map((ChapterItem manga) {
        for (var cache in dataCache) {
          if (manga == cache) {
            manga = cache;
            break;
          }
        }
      });
    } else {
      return dataCache;
    }
    return fetchData;
  }
}
