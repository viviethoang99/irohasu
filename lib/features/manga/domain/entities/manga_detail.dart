import 'chapter_item.dart';
import 'genres.dart';
import 'manga.dart';

typedef ListMangaDetail = List<MangaDetail>;

final class MangaDetail extends Manga {
  const MangaDetail({
    idManga,
    title,
    endpoint,
    thumbnailUrl,
    this.status,
    this.listChapter = const [],
    this.listGenres = const [],
    this.author,
    this.like,
    this.dislike,
    this.description,
  }) : super(
          idManga: idManga,
          thumbnailUrl: thumbnailUrl,
          endpoint: endpoint,
          title: title,
        );

  MangaDetail copyWith({
    String? idManga,
    String? title,
    String? thumbnailUrl,
    String? endpoint,
    String? description,
    String? dislike,
    String? like,
    String? status,
    String? author,
    ListChapter listChapter,
    ListGenres listGenres,
  }) {
    return MangaDetail(
      idManga: idManga ?? this.idManga,
      title: title ?? this.title,
      status: status ?? this.status,
      listChapter: listChapter ?? this.listChapter,
      author: author ?? this.author,
      like: like ?? this.like,
      dislike: dislike ?? this.dislike,
      description: description ?? this.description,
      endpoint: endpoint ?? this.endpoint,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      listGenres: listGenres ?? this.listGenres,
    );
  }

  final String? description;
  final String? dislike;
  final String? like;
  final String? status;
  final String? author;
  final List<ChapterItem> listChapter;
  final ListGenres listGenres;

  @override
  List<Object?> get props => [
        idManga,
        title,
        status,
        listChapter,
        author,
        like,
        dislike,
        description,
        endpoint,
        thumbnailUrl,
        listGenres,
      ];
}
