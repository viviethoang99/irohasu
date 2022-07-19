part of 'manage_favorite_manga_bloc.dart';

abstract class ManageFavoriteMangaEvent extends Equatable {
  const ManageFavoriteMangaEvent();

  @override
  List<Object> get props => [];
}

class GetListFavoriteId extends ManageFavoriteMangaEvent {}
