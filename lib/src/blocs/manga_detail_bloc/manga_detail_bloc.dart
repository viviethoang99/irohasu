import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:irohasu/src/models/chapter_item_model.dart';
import 'package:irohasu/src/models/manga_detail_model.dart';

import '../../../src/resources/manga_detail_repo.dart';
import 'bloc.dart';

class MangaDetailBloc extends Bloc<MangaDetailEvent, MangaDetailState> {
  MangaDetailBloc(this._detailRepo) : super(InitialMangaDetailState());
  final MangaDetailRepo _detailRepo;

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
  }

  Stream<MangaDetailSyncState> loadDataListManga(
      {MangaDetailModel data}) async* {
    var _manga = await fetchListBoxManga(data.idManga);
    if (_manga != null) {
      _manga.listChapter = await syncDataListChapter(
        fetchData: data.listChapter,
        dataLocal: _manga.listChapter,
      );
    }
    yield MangaDetailSyncState(data: _manga ?? data);
  }

  /*
    Find data manga detail in the database Irohasu.
    If not found, return null.
   */
  Future<MangaDetailModel> fetchListBoxManga(String idManga) async {
    final mangaBox = Hive.box('irohasu');
    List listManga = await mangaBox.get('listManga', defaultValue: []);
    MangaDetailModel manga = listManga
        .firstWhere((manga) => manga.idManga == idManga, orElse: () => null);
    // print(manga?.title);
    return manga;
  }

  /*
  Input:
  -  fetchData is list chapter get from the server
  -  dataLocal is list chapter get from database Irohasu
  Output:
  -  Returns the data displayed on the screen.
  Process:
  -  Synchronize retrieved data with the database Irohasu.
  -  If equatable length chapter database => return data database.
  -  Else assign a value to the chapter fetch data if they are equatable.
   */
  Future<List<ChapterItem>> syncDataListChapter({
    List<ChapterItem> fetchData,
    List<ChapterItem> dataLocal,
  }) async {
    if (dataLocal.length != dataLocal.length) {
      for (var i = 0; i < dataLocal.length; i++) {
        if (dataLocal[i] == fetchData[i]) fetchData[i] = dataLocal[i];
      }
    } else {
      return dataLocal;
    }
    return fetchData;
  }
}
