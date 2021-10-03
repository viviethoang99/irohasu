import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/base_content.dart';
import '../../config/config.dart';
import '../../repositories/manga_repository.dart';
import 'bloc.dart';

class MangaDetailBloc extends Bloc<MangaDetailEvent, MangaDetailState> {
  MangaDetailBloc(repo)
      : _repo = repo,
        super(MangaDetailLoadingState());

  final MangaRepository _repo;

  MangaDetailSuccessState? get currentState {
    if (state is MangaDetailSuccessState) {
      return state as MangaDetailSuccessState;
    }
  }

  @override
  Stream<MangaDetailState> mapEventToState(MangaDetailEvent event) async* {
    if (event is FetchMangaDetailEvent) {
      yield MangaDetailLoadingState();
      try {
        final data = await _repo.fetchMangaDetail(event.endpoint!);
        if (data != null) {
          yield MangaDetailSuccessState(mangaDetail: data);
          final listChapter = await _repo.getListChapterReading(data.idManga);
          final mangaLocal = await _repo.getMangaDetailLocal(data.idManga);
          yield currentState!.copyWith(
            mangaDetail: currentState!.mangaDetail.copyWith(
              isFavorite: mangaLocal?.isFavorite,
            ),
            chapterReading: listChapter as List<String>,
          );
        } else {
          final id = event.endpoint!.split('/')[1];
          final listChapter = await _repo.getListChapterReading(id);
          final mangaLocal = await _repo.getMangaDetailLocal(id);
          yield MangaDetailSuccessState(
            mangaDetail: mangaLocal!,
            chapterReading: listChapter as List<String>,
          );
        }
      } on DioError catch (e) {
        yield MangaDetailFailureState(msg: e.toString());
      }
    }
    if (event is CacheMangaDetailEvent && state is MangaDetailSuccessState) {
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
      yield MangaDetailLoadingState();
    }
    if (event is FavoriteMangaEvent) {
      yield currentState!.copyWith(
        mangaDetail: currentState!.mangaDetail.copyWith(
          isFavorite: !currentState!.mangaDetail.isFavorite,
        ),
      );
    }
    if (event is AddChapterToListReading) {
      final newList = currentState!.chapterReading
        ..remove(event.idManga)
        ..add(event.idManga);
      yield currentState!.copyWith(chapterReading: newList);
    }
  }

  String textLastChapter() {
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
