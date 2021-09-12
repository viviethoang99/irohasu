import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/manga_repository.dart';
import 'bloc.dart';

class MangaDetailBloc extends Bloc<MangaDetailEvent, MangaDetailState> {
  MangaDetailBloc(this.repo) : super(MangaDetailLoadingState());

  final MangaRepository repo;

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
        final data = await repo.fetchMangaDetail(event.endpoint!);
        if (data != null) {
          yield MangaDetailSuccessState(mangaDetail: data);
          final listChapter = await repo.getListChapterReading(data.idManga);
          final mangaLocal = await repo.getMangaDetailLocal(data.idManga);
          yield currentState!.copyWith(
            mangaDetail: currentState!.mangaDetail.copyWith(
              isFavorite: mangaLocal?.isFavorite,
            ),
            listChapterReading: listChapter as List<String>,
          );
        }
      } on DioError catch (e) {
        yield MangaDetailFailureState(msg: e.toString());
      }
    }
    if (event is CacheMangaDetailEvent && state is MangaDetailSuccessState) {
      if (currentState!.mangaDetail.isFavorite ||
          currentState!.listChapterReading.isNotEmpty) {
        await repo.addListChapterRead(
          currentState!.listChapterReading,
          currentState!.mangaDetail.idManga,
        );
        await repo.addMangaDetail(
          currentState!.mangaDetail.copyWith(lastRead: DateTime.now()),
        );
      } else {
        await repo.removeMangaDetail(currentState!.mangaDetail.idManga);
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
  }
}
