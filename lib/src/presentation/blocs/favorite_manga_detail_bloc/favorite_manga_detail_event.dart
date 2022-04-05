part of 'favorite_manga_detail_bloc.dart';

abstract class FavoriteMangaDetailEvent extends Equatable {
  const FavoriteMangaDetailEvent();

  @override
  List<Object> get props => [];
}

class GetStatusFavoriteManga extends FavoriteMangaDetailEvent {}

class SetStatusFavoriteManga extends FavoriteMangaDetailEvent {}
