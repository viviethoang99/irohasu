import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/manga_detail.dart';
import '../../../domain/repositories/i_manga_repository.dart';

part 'history_screen_event.dart';
part 'history_screen_state.dart';

class HistoryScreenBloc extends Bloc<HistoryScreenEvent, HistoryScreenState> {
  HistoryScreenBloc(IMangaRepository repo)
      : _repo = repo,
        super(const HistoryScreenState()) {
    on<FetchDataHistory>(_fetchData);
  }

  final IMangaRepository _repo;

  void _fetchData(FetchDataHistory event, Emitter<HistoryScreenState> emit) {}
}
