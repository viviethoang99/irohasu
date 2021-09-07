import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/chapter_model.dart';
import '../../repositories/chaper_repository.dart';
import 'bloc.dart';

enum ReadingMode { horizontal, vertical }

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  ChapterBloc(this.repository) : super(InitialChapterState());
  
  final ChapterRepository repository;

  @override
  Stream<ChapterState> mapEventToState(ChapterEvent event) async* {
    if (event is FetchDataChapterEvent) {
      yield ChapterLoadingState();
      try {
        final data = await repository.fetchDataChapter(event.endpoint!);
        yield ChapterLoadedState(data: data);
      } catch (e) {
        yield ChapterFailureState(msg: e.toString());
      }
    }
    if (event is FetchDataDownloadEvent) {
      yield ChapterLoadingState();
      try {
        final data = ChapterModel(
          title: event.item!.title,
          endpoint: event.item!.endpoint,
          id: event.item!.idChapter,
          nameManga: event.titleManga,
          mangaEndpoint: event.mangaDetail,
        );
        yield ChapterLoadedState(data: data);
      } catch (e) {
        rethrow;
      }
    }
  }
}
