part of 'list_manga_bloc.dart';

abstract class ListMangaEvent extends Equatable {
  const ListMangaEvent();

  @override
  List<Object> get props => [];
}

class FetchListMangaEvent extends ListMangaEvent {}

class InitialFetchMangaEvent extends ListMangaEvent {}

class RefreshMangaEvent extends ListMangaEvent {}
