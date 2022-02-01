import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart' as rx;

import '../../../data/model/manga_list_model.dart';
import '../../../domain/repositories/manga_repository.dart';

part 'list_manga_event.dart';
part 'list_manga_state.dart';

class ListMangaBloc extends Bloc<ListMangaEvent, ListMangaState> {
  ListMangaBloc(this._repository) : super(const ListMangaState()) {
    on<InitialFetchMangaEvent>(_initialEvent, transformer: _debounce());
    on<FetchListMangaEvent>(_fetchListManga, transformer: _debounce());
    on<RefreshMangaEvent>(_refreshEvent, transformer: _debounce());
  }

  final MangaRepository _repository;

  EventTransformer<T> _debounce<T>() {
    final _duration = const Duration(milliseconds: 500);
    return (events, mapper) => events.debounceTime(_duration).flatMap(mapper);
  }

  Future<void> _fetchListManga(
    FetchListMangaEvent event,
    Emitter<ListMangaState> emit,
  ) async {
    final data = await _repository.fetchListManga(page: state.page);
    data.isEmpty
        ? emit(state.copyWith(hasReachedMax: true))
        : emit(state.copyWith(
            listManga: [...state.listManga, ...data],
            hasReachedMax: false,
            page: state.page + 1,
          ));
  }

  Future<void> _initialEvent(
    InitialFetchMangaEvent event,
    Emitter<ListMangaState> emit,
  ) async {
    emit(const ListMangaState());
    final data = await _repository.fetchListManga();
    emit(state.copyWith(
      listManga: data,
      hasReachedMax: data.length < 20 ? true : false,
      page: data.isNotEmpty ? state.page + 1 : state.page,
    ));
  }

  Future<void> _refreshEvent(
    RefreshMangaEvent event,
    Emitter<ListMangaState> emit,
  ) async =>
      add(InitialFetchMangaEvent());
}
