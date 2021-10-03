import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/manga_detail_model.dart';
import '../../repositories/manga_repository.dart';

part 'library_screen_event.dart';
part 'library_screen_state.dart';

class LibraryScreenBloc extends Bloc<LibraryScreenEvent, LibraryScreenState> {
  LibraryScreenBloc(repo)
      : _repo = repo,
        super(const LibraryScreenState()) {
    on<FetchDataLibrary>(_fetchData);
  }

  final MangaRepository _repo;

  void _fetchData(FetchDataLibrary event, Emitter<LibraryScreenState> emit) {
    _repo.getListChapter().listen(
          (event) => emit(state.copyWith(listManga: event)),
        );
  }
}
