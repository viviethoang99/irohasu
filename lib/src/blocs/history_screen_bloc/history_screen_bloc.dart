import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/manga_detail_model.dart';
import '../../repositories/manga_repository.dart';

part 'history_screen_event.dart';
part 'history_screen_state.dart';

class HistoryScreenBloc extends Bloc<HistoryScreenEvent, HistoryScreenState> {
  HistoryScreenBloc(repo)
      : _repo = repo,
        super(const HistoryScreenState()) {
    on<FetchDataHistory>(_fetchData);
  }

  final MangaRepository _repo;

  void _fetchData(FetchDataHistory event, Emitter<HistoryScreenState> emit) {
    _repo.getListChapter().listen(
          (event) => emit(state.copyWith(listManga: event)),
        );
  }
}
