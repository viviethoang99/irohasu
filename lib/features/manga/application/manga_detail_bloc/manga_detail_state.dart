part of 'manga_detail_bloc.dart';

abstract class MangaDetailState extends Equatable {
  const MangaDetailState({this.colorManga = Colors.white});

  final Color colorManga;

  @override
  List<Object?> get props => [colorManga];
}

class MangaDetailLoadingState extends MangaDetailState {
  const MangaDetailLoadingState({
    super.colorManga,
    required this.params,
  });

  final MangaDetailScreenParams params;
}

class MangaDetailSuccessState extends MangaDetailState {
  const MangaDetailSuccessState({
    required this.mangaDetail,
    this.chapterReading = const [],
    super.colorManga,
  });
  final MangaDetail mangaDetail;
  final List<String> chapterReading;

  MangaDetailSuccessState copyWith({
    MangaDetail? mangaDetail,
    List<String>? chapterReading,
  }) {
    return MangaDetailSuccessState(
      colorManga: colorManga,
      mangaDetail: mangaDetail ?? this.mangaDetail,
    );
  }

  @override
  List<Object?> get props => [mangaDetail, chapterReading];
}

class MangaDetailFailureState extends MangaDetailState {
  const MangaDetailFailureState({this.msg, super.colorManga});
  final String? msg;

  @override
  List<Object?> get props => [msg];
}
