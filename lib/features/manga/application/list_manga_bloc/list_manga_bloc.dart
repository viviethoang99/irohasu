import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart' as rx;

import '../../domain/usecase/list_manga/fetch_list_manga_usecase.dart';
import '../../manga.dart';


part 'list_manga_event.dart';
part 'list_manga_state.dart';

@injectable
class ListMangaBloc extends Bloc<ListMangaEvent, ListMangaState> {
  ListMangaBloc(this._fetchData) : super(const ListMangaState()) {
    on<InitialFetchMangaEvent>(_initialEvent, transformer: _debounce());
    on<FetchListMangaEvent>(_fetchListManga, transformer: _debounce());
    on<RefreshMangaEvent>(_refreshEvent, transformer: _debounce());
  }

  final FetchListMangaUseCase _fetchData;

  EventTransformer<T> _debounce<T>() {
    const duration = Duration(milliseconds: 500);
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  Future<void> _fetchListManga(
    FetchListMangaEvent event,
    Emitter<ListMangaState> emit,
  ) async {
    final either = await _fetchData(params: state.page);
    either.fold(
      (l) => null,
      (data) => {
        data.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
                listManga: [...state.listManga, ...data],
                hasReachedMax: false,
                page: state.page + 1,
              ))
      },
    );
  }

  Future<void> _initialEvent(
    InitialFetchMangaEvent event,
    Emitter<ListMangaState> emit,
  ) async {
    emit(const ListMangaState());
    final either = await _fetchData(params: state.page);
    either.fold(
      (error) => emit(const ListMangaState(
        listManga: [],
        status: ListMangaScreenStatus.failure,
      )),
      (data) => {
        emit(state.copyWith(
          listManga: data,
          hasReachedMax: data.length < 20 ? true : false,
          page: data.isNotEmpty ? state.page + 1 : state.page,
        ))
      },
    );
  }

  Future<void> _refreshEvent(
    RefreshMangaEvent event,
    Emitter<ListMangaState> emit,
  ) async =>
      add(InitialFetchMangaEvent());
}
