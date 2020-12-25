import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/resources/chapter_repo.dart';
import 'bloc.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  ChapterBloc(this._chapterRepo) : super(InitialChapterState());
  final ChapterRepo _chapterRepo;

  @override
  Stream<ChapterState> mapEventToState(ChapterEvent event) async* {
    if (event is FetchDataChapterEvent) {
      yield ChapterLoadingState();
      try{
        final data = await _chapterRepo.getDataChapter(event.endpoint);
        yield ChapterLoadedState(data: data);
      }
      catch(e){
        yield ChapterFailureState(msg: e.toString());
      }
    }
  }

}