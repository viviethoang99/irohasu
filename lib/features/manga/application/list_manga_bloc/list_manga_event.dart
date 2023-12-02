part of 'list_manga_bloc.dart';

sealed class ListMangaEvent extends Equatable {
  const ListMangaEvent();

  @override
  List<Object> get props => [];
}

final class FetchListMangaEvent extends ListMangaEvent {}

final class InitialFetchMangaEvent extends ListMangaEvent {}

final class RefreshMangaEvent extends ListMangaEvent {}
