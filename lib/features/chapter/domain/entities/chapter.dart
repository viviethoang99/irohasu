import 'package:equatable/equatable.dart';

typedef ListPage = List<ChapterImage>;

class Chapter extends Equatable {
  const Chapter({
    this.id,
    this.title,
    this.endpoint,
    this.listImage,
    this.mangaEndpoint,
    this.nameManga,
    this.nextChapter,
    this.prevChapter,
  });

  final String? id;
  final String? title;
  final String? endpoint;
  final String? mangaEndpoint;
  final String? nameManga;
  final List<ChapterImage>? listImage;
  final String? prevChapter;
  final String? nextChapter;

  @override
  List<Object?> get props => [
        id,
        title,
        endpoint,
        mangaEndpoint,
        nameManga,
        listImage,
      ];
}

class ChapterImage extends Equatable {
  const ChapterImage({
    required this.urlImage,
    required this.number,
  });

  final String? urlImage;
  final int? number;

  @override
  List<Object?> get props => [urlImage, number];
}
