import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/i_favorite_repository.dart';

part 'manage_favorite_manga_event.dart';
part 'manage_favorite_manga_state.dart';

@injectable
class ManageFavoriteMangaBloc
    extends Bloc<ManageFavoriteMangaEvent, ManageFavoriteMangaState> {
  ManageFavoriteMangaBloc(this._repository)
      : super(const ManageFavoriteMangaState([])) {
    on<GetListFavoriteId>(_fetchData);
  }

  final IFavoriteRepository _repository;

  Future<void> _fetchData(
    GetListFavoriteId event,
    Emitter<ManageFavoriteMangaState> emit,
  ) async {
    final repository = _repository.getListFavorite();
    emit(repository.fold(
      (_) => const ManageFavoriteMangaState([]),
      ManageFavoriteMangaState.new,
    ));
  }
}
