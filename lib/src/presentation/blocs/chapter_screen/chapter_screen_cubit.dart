import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/extensions/extensions.dart';
import '../../../data/model/chapter/chapter_model.dart';
import '../../../data/model/manga_detail_model.dart';
import '../../../domain/repositories/chaper_repository.dart';
import '../manga_detail_bloc/manga_detail_bloc.dart';

part 'chapter_screen_state.dart';

class ChapterScreenCubit extends Cubit<ChapterScreenState> {
  ChapterScreenCubit({
    required this.repository,
    // this.changeReadingModeBloc,
    required this.mangaDetailBloc,
  }) : super(const ChapterScreenState());

  final ChapterRepository repository;
  final MangaDetailBloc mangaDetailBloc;
  // final ChangeReadingModeBloc changeReadingModeBloc;

  Future<void> initLoad(String endpoint) async {
    await getListChapter();
    await fetchDataFromApi(endpoint);
    // if (isDownload(endpoint) ?? false) {
    //   await fetchDataFromLocal();
    // } else {
    //   await fetchDataFromApi(endpoint);
    // }
  }

  String get nameChapter => state.chapter!.title!
      .replaceAll(state.mangaDetail!.title, '')
      .trim()
      .capitalize();

  int get indexChapter => state.mangaDetail!.listChapter!
      .indexWhere((element) => element.endpoint == state.chapter!.endpoint);

  Future<void> getListChapter() async {
    if (mangaDetailBloc.state is MangaDetailSuccessState) {
      final stateManga = mangaDetailBloc.state as MangaDetailSuccessState;
      emit(state.copyWith(mangaDetail: stateManga.mangaDetail));
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
      emit(state.copyWith(
        chapter: data,
        isLoading: false,
      ));
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

  void nextChapter() {
    final chapter = state.mangaDetail!.listChapter![indexChapter + 1];
    fetchDataFromApi(chapter.endpoint!);
  }

  void preChapter() {
    final chapter = state.mangaDetail!.listChapter![indexChapter - 1];
    fetchDataFromApi(chapter.endpoint!);
  }
}
