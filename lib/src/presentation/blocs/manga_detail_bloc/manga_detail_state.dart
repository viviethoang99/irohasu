import 'package:equatable/equatable.dart';
import '../../../data/model/manga_detail_model.dart';

abstract class MangaDetailState extends Equatable {
  const MangaDetailState();
  @override
  List<Object?> get props => [];
}

class MangaDetailLoadingState extends MangaDetailState {}

class MangaDetailSuccessState extends MangaDetailState {
  const MangaDetailSuccessState({
    required this.mangaDetail,
    this.chapterReading = const [],
  });

  final MangaDetailModel mangaDetail;
  final List<String> chapterReading;

  MangaDetailSuccessState copyWith({
    MangaDetailModel? mangaDetail,
    List<String>? chapterReading,
  }) {
    return MangaDetailSuccessState(
      mangaDetail: mangaDetail ?? this.mangaDetail,
      chapterReading: chapterReading ?? this.chapterReading,
    );
  }

  @override
  List<Object?> get props => [mangaDetail, chapterReading];
}

class MangaDetailFailureState extends MangaDetailState {
  MangaDetailFailureState({this.msg});
  final String? msg;

  @override
  List<Object?> get props => [msg];
}
