import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../../domain/usecase/favorite_manga/find_list_manga_library_usecase.dart';
import '../../domain/usecase/favorite_manga/watch_id_favorite_tab_usecase.dart';

part 'library_screen_event.dart';
part 'library_screen_state.dart';

@injectable
class LibraryScreenBloc extends Bloc<LibraryScreenEvent, LibraryScreenState> {
  LibraryScreenBloc(
    this._getAllMangaUseCase,
    this._favoriteTabUseCase,
  ) : super(const LibraryLoadingScreen()) {
    on<FetchDataLibrary>(_fetchData);
    on<WatchDataLibrary>(_watchFavoriteManga);
  }

  final FindListMangaLibraryUseCase _getAllMangaUseCase;
  final WatchIdFavoriteTabUseCase _favoriteTabUseCase;

  Future<void> _fetchData(
    FetchDataLibrary event,
    Emitter<LibraryScreenState> emit,
  ) async {
    emit(const LibraryLoadingScreen());
    final repository = await _getAllMangaUseCase.call(params: event.listId);
    emit(repository.fold(
      LibraryFailureScreen.new,
      LibrarySuccessScreen.new,
    ));
  }

  /// Watches for any updated [MangaDetail] from [WatchIdFavoriteTabUseCase] and
  /// emits [LibraryScreenState] state with all manga list.
  ///
  /// Before watching for any update, it will load all manga by calling
  /// [FetchDataLibrary] event.
  Future<void> _watchFavoriteManga(
    WatchDataLibrary event,
    Emitter<LibraryScreenState> emit,
  ) async {
    add(FetchDataLibrary(event.listId));
    final repository = await _favoriteTabUseCase.call(
      params: const NoParams(),
    );
    await repository.fold(
      (failed) => null,
      (success) async {
        await emit.onEach(
          success,
          onData: (List<String> data) => add(FetchDataLibrary(data)),
        );
      },
    );
  }
}
