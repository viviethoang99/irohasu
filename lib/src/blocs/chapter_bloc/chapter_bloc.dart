import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/resources/chapter_repo.dart';
import '../../models/chapter_model.dart';
import 'bloc.dart';

enum ReadingMode { horizontal, vertical }

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  ChapterBloc(this._chapterRepo) : super(InitialChapterState());
  final ChapterRepo _chapterRepo;

  @override
  Stream<ChapterState> mapEventToState(ChapterEvent event) async* {
    if (event is FetchDataChapterEvent) {
      yield ChapterLoadingState();
      try {
        final data = await _chapterRepo.getDataChapter(event.endpoint!);
        yield ChapterLoadedState(data: data);
      } catch (e) {
        yield ChapterFailureState(msg: e.toString());
      }
    }
    if (event is FetchDataDownloadEvent) {
      yield ChapterLoadingState();
      try {
        final data = ChapterModel(
          titleChapter: event.item!.chapterTitle,
          chapterEndpoint: event.item!.chapterEndpoint,
          idChapter: event.item!.idChapter,
          titleManga: event.titleManga,
          mangaDetail: event.mangaDetail,
        );
        yield ChapterLoadedState(data: data);
      } catch (e) {
        rethrow;
      }
    }
  }
}
