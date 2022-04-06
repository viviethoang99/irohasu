import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecaes/favorite_manga/change_status_favorite_usercase.dart';
import '../../../domain/usecaes/favorite_manga/is_favorite_usecase.dart';

part 'favorite_manga_detail_event.dart';

@injectable
class FavoriteMangaDetailBloc extends Bloc<FavoriteMangaDetailEvent, bool> {
  FavoriteMangaDetailBloc(
    this._changeStatusFavoriteUseCase,
    this._isFavoriteUseCase,
    @factoryParam this.endpoint,
  ) : super(false) {
    on<GetStatusFavoriteManga>(_updateStatus);
    on<SetStatusFavoriteManga>(_setStatusManga);
  }

  final IsFavoriteUseCase _isFavoriteUseCase;
  final ChangeStatusFavoriteUseCase _changeStatusFavoriteUseCase;
  final String endpoint;

  String get idManga {
    return endpoint.split('/')[1];
  }

  Future<void> _updateStatus(
    GetStatusFavoriteManga event,
    Emitter<bool> emit,
  ) async {
    final either = await _isFavoriteUseCase(params: idManga);
    either.fold(
      (error) => null,
      (isFavorite) => emit(isFavorite),
    );
  }

  Future<void> _setStatusManga(
    SetStatusFavoriteManga event,
    Emitter<bool> emit,
  ) async {
    final params = ChangeStatusFavoriteParams(
      id: idManga,
      isFavorite: state,
    );
    final either = await _changeStatusFavoriteUseCase(params: params);
    either.fold(
      (error) => null,
      (_) => add(GetStatusFavoriteManga()),
    );
  }
}
