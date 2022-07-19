part of 'manage_favorite_manga_bloc.dart';

class ManageFavoriteMangaState extends Equatable {
  const ManageFavoriteMangaState(this.listId);

  final List<String> listId;

  @override
  List<Object> get props => [listId];
}
