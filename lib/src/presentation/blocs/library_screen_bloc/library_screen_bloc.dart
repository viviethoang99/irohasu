import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/manga_detail.dart';
import '../../../domain/repositories/i_manga_repository.dart';

part 'library_screen_event.dart';
part 'library_screen_state.dart';

@injectable
class LibraryScreenBloc extends Bloc<LibraryScreenEvent, LibraryScreenState> {
  LibraryScreenBloc(this._repo) : super(const LibraryScreenState([])) {
    on<FetchDataLibrary>(_fetchData);
    on<WatchDataLibrary>(_watchAllAlbums);
  }

  final IMangaRepository _repo;
  StreamSubscription? _streamSubscription;

  Future<void> _fetchData(
    FetchDataLibrary event,
    Emitter<LibraryScreenState> emit,
  ) async {
    final data = await _repo.getAllManga();
    emit(LibraryScreenState(data));
  }

  /// Watches for any updated [MangaDetail] from [_repo] and
  /// emits [LibraryScreenState] state with all manga list.
  ///
  /// Before watching for any update, it will load all manga by calling
  /// [FetchDataLibrary] event.
  Future<void> _watchAllAlbums(
    WatchDataLibrary event,
    Emitter<LibraryScreenState> emit,
  ) async {
    await _loadAllAlbums(emit);
    _streamSubscription ??=
        _repo.watchAllManga().map(LibraryScreenState.new).listen(emit);
  }

  Future<void> _loadAllAlbums(Emitter<LibraryScreenState> emit) async {
    final response = await _repo.getAllManga();
    emit(LibraryScreenState(response));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
