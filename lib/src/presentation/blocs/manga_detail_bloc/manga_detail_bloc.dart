import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../config/base_content.dart';
import '../../../config/config.dart';
import '../../../data/model/manga_detail_model.dart';
import '../../../domain/repositories/manga_repository.dart';

part 'manga_detail_event.dart';
part 'manga_detail_state.dart';

class MangaDetailBloc extends Bloc<MangaDetailEvent, MangaDetailState> {
  MangaDetailBloc(this._repo) : super(MangaDetailLoadingState()) {
    on<FetchMangaDetailEvent>(_fetchMangaDetail);
    on<CacheMangaDetailEvent>(_saveMangaToLocal);
    on<FavoriteMangaEvent>(_favoriteManga);
    on<AddChapterToListReading>(_setLastReadingToChapter);
  }

  final IMangaRepository _repo;

  MangaDetailSuccessState? get currentState {
    if (state is MangaDetailSuccessState) {
      return state as MangaDetailSuccessState;
    }
  }

  Future<void> _fetchMangaDetail(
    FetchMangaDetailEvent event,
    Emitter<MangaDetailState> emit,
  ) async {
    emit(MangaDetailLoadingState());
    try {
      final data = await _repo.fetchMangaDetail(event.endpoint!);
      if (data != null) {
        emit(MangaDetailSuccessState(mangaDetail: data));
        final listChapter = await _repo.getListChapterReading(data.idManga);
        final mangaLocal = await _repo.getMangaDetailLocal(data.idManga);
        emit(currentState!.copyWith(
          mangaDetail: currentState!.mangaDetail.copyWith(
            isFavorite: mangaLocal?.isFavorite,
          ),
          chapterReading: listChapter as List<String>,
        ));
      } else {
        final id = event.endpoint!.split('/')[1];
        final listChapter = await _repo.getListChapterReading(id);
        final mangaLocal = await _repo.getMangaDetailLocal(id);
        emit(MangaDetailSuccessState(
          mangaDetail: mangaLocal!,
          chapterReading: listChapter as List<String>,
        ));
      }
    } catch (e) {
      emit(MangaDetailFailureState(msg: e.toString()));
    }
  }

  Future<void> _saveMangaToLocal(
    CacheMangaDetailEvent event,
    Emitter<MangaDetailState> emit,
  ) async {
    if (currentState!.mangaDetail.isFavorite ||
        currentState!.chapterReading.isNotEmpty) {
      await _repo.addListChapterRead(
        currentState!.chapterReading,
        currentState!.mangaDetail.idManga,
      );
      await _repo.addMangaDetail(
        currentState!.mangaDetail.copyWith(lastRead: DateTime.now()),
      );
    } else {
      await _repo.removeMangaDetail(currentState!.mangaDetail.idManga);
    }
  }

  Future<void> _favoriteManga(
    FavoriteMangaEvent event,
    Emitter<MangaDetailState> emit,
  ) async {
    emit(currentState!.copyWith(
      mangaDetail: currentState!.mangaDetail.setFavorite(),
    ));
  }

  Future<void> _setLastReadingToChapter(
    AddChapterToListReading event,
    Emitter<MangaDetailState> emit,
  ) async {
    final newList = currentState!.chapterReading
      ..remove(event.idManga)
      ..add(event.idManga);
    emit(currentState!.copyWith(chapterReading: newList));
  }

  String get lastChapter {
    if (currentState!.chapterReading.isNotEmpty) {
      final title = currentState!.mangaDetail.listChapter!
          .firstWhere((chap) => chap.id == currentState!.chapterReading.last)
          .title!
          .split(' ');
      final _index = title.indexWhere(
              (e) => Constants.keywordChapter.contains(e.toLowerCase())) +
          1;
      if (_index == 0) {
        return 'TIẾP TỤC ĐỌC'.toUpperCase();
      } else {
        final lastChapter = title[_index].replaceAll(':', '').trim();
        return 'TIẾP TỤC ĐỌC TỪ CHƯƠNG $lastChapter'.toUpperCase();
      }
    }
    return ConstantStrings.startReading.toUpperCase();
  }
}
