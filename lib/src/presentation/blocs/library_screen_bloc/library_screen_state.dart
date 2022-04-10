part of 'library_screen_bloc.dart';

class LibraryScreenState extends Equatable {
  const LibraryScreenState(
    this.listManga,
  );

  final List<MangaDetail> listManga;

  LibraryScreenState copyWith({List<MangaDetail>? listManga}) {
    return LibraryScreenState(
      listManga ?? this.listManga,
    );
  }

  @override
  List<Object> get props => [listManga];
}
