import 'package:hive/hive.dart';
import 'package:html/dom.dart';

import '../../../../../config/base_content.dart';
import '../../../../../core/core.dart';

import '../../../domain/entities/manga_detail.dart';
import 'chapter_item_dto.dart';
import 'genres_dto.dart';

part 'manga_detail_dto.g.dart';

typedef ListMangaDetailDto = List<MangaDetailDto>;

@HiveType(typeId: 0)
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

  factory MangaDetailDto.fromHTML(Document data, String endpoint) {
    final description = data.querySelectorAll('div.description > p');
    final getTotalLike =
        data.querySelector('.total-vote')?.attributes['ng-init'];
    final countLike = MangaDetailHelper.countTotalLike(getTotalLike);
    final getAuthor = MangaDetailHelper.findElement(description, 'Tác giả')
        ?.querySelectorAll('a');
    final getListChapters = data.querySelectorAll('#list-chapters > p');
    final getListGenres = MangaDetailHelper.findElement(description, 'Thể loại')
        ?.querySelectorAll('span a');
    final urlThumb = data.querySelector('.thumbnail img')?.attributes['src'];
    final title = data
        .querySelector('Title')!
        .text
        .replaceFirst('| BlogTruyen.VN', '')
        .trim();
    return MangaDetailDto(
      idManga: endpoint.toId,
      title: title,
      thumbnailUrl: urlThumb ?? '',
      endpoint: endpoint,
      author: MangaDetailHelper.getElement(getAuthor),
      description: data.querySelector('div.detail > div.content')?.text.trim(),
      like: countLike['TotalLike'],
      dislike: countLike['TotalDisLike'],
      status: MangaDetailHelper.findElement(description, ConstantStrings.status)
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

  @HiveField(0)
  final String idManga;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String thumbnailUrl;
  @HiveField(3)
  final String endpoint;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? dislike;
  @HiveField(6)
  final String? like;
  @HiveField(7)
  final String? status;
  @HiveField(8)
  final String? author;
  @HiveField(9, defaultValue: [])
  final List<ChapterItemDto> listChapter;
  @HiveField(10, defaultValue: [])
  final List<GenresDto> listGenres;
}

extension ListMangaDetailDtoX on ListMangaDetailDto {
  ListMangaDetail toEntities() => map((manga) => manga.toEntity()).toList();
}
