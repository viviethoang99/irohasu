import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/chapter_model.dart';
import '../../models/manga_detail_model.dart';
import '../../repositories/chaper_repository.dart';
import '../manga_detail_bloc/bloc.dart';

part 'chapter_screen_state.dart';

class ChapterScreenCubit extends Cubit<ChapterScreenState> {
  ChapterScreenCubit(
    this.repository,
    // this.changeReadingModeBloc,
    this.mangaDetailBloc,
  ) : super(const ChapterScreenState());

  final ChapterRepository repository;
  final MangaDetailBloc mangaDetailBloc;
  // final ChangeReadingModeBloc changeReadingModeBloc;

  Future<void> initLoad(String endpoint) async {
    await getListChapter();
    if (isDownload(endpoint) ?? false) {
      await fetchDataFromLocal();
    } else {
      await fetchDataFromApi(endpoint);
    }
  }

  Future<void> getListChapter() async {
    if (mangaDetailBloc.state is MangaDetailLoadedState) {
      final stateManga = mangaDetailBloc.state as MangaDetailLoadedState;
      emit(state.copyWith(mangaDetail: stateManga.data));
    } else {
      emit(state.copyWith(isLoading: true));
    }
  }

  bool? isDownload(endpoint) => state.mangaDetail?.listChapter
      ?.firstWhere((chapter) => chapter.endpoint == endpoint)
      .isDownload
      ?.isEmpty;

  Future<void> fetchDataFromApi(String endpoint) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final data = await repository.fetchDataChapter(endpoint);
      emit(state.copyWith(chapter: data));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> fetchDataFromLocal() async {
    emit(state.copyWith(isLoading: true, error: ''));
    // try {
    //   final data = ChapterModel(
    //     title: event.item!.title,
    //     endpoint: event.item!.endpoint,
    //     id: event.item!.idChapter,
    //     nameManga: event.titleManga,
    //     mangaEndpoint: event.mangaDetail,
    //   );
    //   yield ChapterLoadedState(data: data);
    // } catch (e) {
    //   rethrow;
    // }
  }
}
