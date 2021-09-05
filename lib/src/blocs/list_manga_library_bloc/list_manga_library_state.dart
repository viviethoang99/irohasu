part of 'list_manga_library_bloc.dart';

@immutable
abstract class ListMangaLibraryState extends Equatable {
  const ListMangaLibraryState();

  @override
  List<Object> get props => [];
}

class ListMangaLibraryInitial extends ListMangaLibraryState {}

class ListMangaLibraryLoading extends ListMangaLibraryState {}

class ListMangaLibraryLoaded extends ListMangaLibraryState {
  ListMangaLibraryLoaded({required this.listCache});
  
  final List listCache;

  @override
  List<Object> get props => [listCache];
}

class ListMangaLibraryFail extends ListMangaLibraryState {}
