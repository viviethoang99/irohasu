import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/manga_detail_model.dart';
import '../../../domain/repositories/i_manga_repository.dart';

part 'library_screen_event.dart';
part 'library_screen_state.dart';

@injectable
class LibraryScreenBloc extends Bloc<LibraryScreenEvent, LibraryScreenState> {
  LibraryScreenBloc(this._repo) : super(const LibraryScreenState()) {
    on<FetchDataLibrary>(_fetchData);
  }

  final IMangaRepository _repo;

  Future<void> _fetchData(
    FetchDataLibrary event,
    Emitter<LibraryScreenState> emit,
  ) async {
    final data = await _repo.getAllManga();
    emit(LibraryScreenState(listManga: data));
  }
}
