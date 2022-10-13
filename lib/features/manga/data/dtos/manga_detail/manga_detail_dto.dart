import 'package:isar/isar.dart';

import '../../../../../config/base_content.dart';
import '../../../../../core/core.dart';

import '../../../domain/entities/manga_detail.dart';
import 'chapter_item_dto.dart';
import 'genres_dto.dart';

part 'manga_detail_dto.g.dart';

typedef ListMangaDetailDto = List<MangaDetailDto>;

@collection
class MangaDetailDto {
  const MangaDetailDto({
    required this.idManga,
    required this.title,
    required this.endpoint,
    required this.thumbnailUrl,
    this.status,
    this.listChapter = const [],
    this.listGenres = const [],
    this.author,
    this.like,
    this.dislike,
    this.description,
  });

  factory MangaDetailDto.fromHTML(DartSoup data, String endpoint) {
    final description = data.findAll('div.description > p');
    final getTotalLike = data.call('.total-vote')?.attributes['ng-init'];
    final countLike = data.countTotalLike(getTotalLike);
    final getAuthor =
        data.findByText(description, 'Tác giả')?.querySelectorAll('a');
    final getListChapters = data.findAll('#list-chapters > p');
    final getListGenres =
        data.findByText(description, 'Thể loại')?.querySelectorAll('span a');

    return MangaDetailDto(
      idManga: int.tryParse(endpoint.toId) ?? Isar.autoIncrement,
      title: data.call('Title')!.text.replaceFirst('| BlogTruyen.VN', ''),
      thumbnailUrl: data.call('.thumbnail img')?.attributes['src'] ?? '',
      endpoint: endpoint,
      author: data.listElementToString(getAuthor),
      description: data.call('div.detail > div.content')?.text.trim(),
      like: countLike['TotalLike'],
      dislike: countLike['TotalDisLike'],
      status: data
          .findByText(description, ConstantStrings.status)
          ?.querySelector('span.color-red')
          ?.text,
      listChapter: List<ChapterItemDto>.from(
        getListChapters.map<ChapterItemDto>(ChapterItemDto.fromHTML),
      ),
      listGenres: List<GenresDto>.from(
        getListGenres!.map<GenresDto>(GenresDto.fromHTML),
      ),
    );
  }

  MangaDetail toEntity() {
    return MangaDetail(
      idManga: idManga,
      title: title,
      thumbnailUrl: thumbnailUrl,
      endpoint: endpoint,
      author: author,
      description: description,
      like: like,
      dislike: dislike,
      status: status,
      listGenres: listGenres.map((genres) => genres.toModel()).toList(),
      listChapter: listChapter.map((chapter) => chapter.toModel()).toList(),
    );
  }

  final Id idManga;
  final String title;
  final String thumbnailUrl;
  final String endpoint;
  final String? description;
  final String? dislike;
  final String? like;
  final String? status;
  final String? author;
  final List<ChapterItemDto> listChapter;
  final List<GenresDto> listGenres;
}

extension ListMangaDetailDtoX on ListMangaDetailDto? {
  ListMangaDetail toEntities() =>
      this?.map((manga) => manga.toEntity()).toList() ?? [];
}
