part of 'manga_detail_bloc.dart';

enum MangaDetailStatus { loading, failed, success }

final class MangaDetailState extends Equatable {
  const MangaDetailState({
    this.mangaDetail,
    this.chapterReading = const [],
    this.status = MangaDetailStatus.loading,
    this.isFavoriteManga = false,
  });

  final MangaDetail? mangaDetail;
  final MangaDetailStatus status;
  final List<String> chapterReading;
  final bool isFavoriteManga;

  MangaDetailState copyWith({
    MangaDetail? mangaDetail,
    List<String>? chapterReading,
    MangaDetailStatus? status,
    bool? isFavoriteManga,
  }) {
    return MangaDetailState(
      mangaDetail: mangaDetail ?? this.mangaDetail,
      chapterReading: chapterReading ?? this.chapterReading,
      status: status ?? this.status,
      isFavoriteManga: isFavoriteManga ?? this.isFavoriteManga,
    );
  }

  @override
  List<Object?> get props => [
        mangaDetail,
        chapterReading,
        status,
        isFavoriteManga,
      ];
}
