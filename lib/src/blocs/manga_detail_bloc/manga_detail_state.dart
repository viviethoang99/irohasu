import 'package:equatable/equatable.dart';

import '../../models/manga_detail_model.dart';

abstract class MangaDetailState extends Equatable {
  const MangaDetailState();
  @override
  List<Object?> get props => [];
}

class MangaDetailLoadingState extends MangaDetailState {}

class MangaDetailSuccessState extends MangaDetailState {
  const MangaDetailSuccessState({
    required this.mangaDetail,
    this.listChapterReading = const [],
  });

  final MangaDetailModel mangaDetail;
  final List<String> listChapterReading;

  MangaDetailSuccessState copyWith({
    MangaDetailModel? mangaDetail,
    List<String>? listChapterReading,
  }) {
    return MangaDetailSuccessState(
      mangaDetail: mangaDetail ?? this.mangaDetail,
      listChapterReading: listChapterReading ?? this.listChapterReading,
    );
  }

  @override
  List<Object?> get props => [mangaDetail, listChapterReading];
}

class MangaDetailFailureState extends MangaDetailState {
  MangaDetailFailureState({this.msg});
  final String? msg;

  @override
  List<Object?> get props => [msg];
}
