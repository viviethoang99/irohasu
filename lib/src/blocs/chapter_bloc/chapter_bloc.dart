import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/models/chapter_model.dart';
import '../../../src/resources/chapter_repo.dart';
import 'bloc.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  final ChapterRepo _chapterRepo;

  ChapterBloc(this._chapterRepo) : super(InitialChapterState());

  @override
  Stream<ChapterState> mapEventToState(ChapterEvent event) async* {
    if (event is FetchDataChapterEvent) {
      yield ChapterLoadingState();
      try{
        final ChapterModel data = await _chapterRepo.getDataChapter(event.endpoint);
        yield ChapterLoadedState(data: data);
      }
      catch(e){
        yield ChapterFailureState(msg: e.toString());
      }
    }
  }

}