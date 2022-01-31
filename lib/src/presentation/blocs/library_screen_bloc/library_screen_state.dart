part of 'library_screen_bloc.dart';

class LibraryScreenState extends Equatable {
  const LibraryScreenState({
    this.listManga = const <MangaDetailModel>[],
  });

  final List<MangaDetailModel> listManga;

  LibraryScreenState copyWith({List<MangaDetailModel>? listManga}) {
    return LibraryScreenState(
      listManga: listManga ?? this.listManga,
    );
  }

  @override
  List<Object> get props => [listManga];
}
