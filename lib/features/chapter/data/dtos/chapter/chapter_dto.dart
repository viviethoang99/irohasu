import 'package:hive_flutter/adapters.dart';

import '../../../../../core/core.dart';
import '../../../../../env.dart';
import '../../../chapter.dart';

part 'chapter_dto.g.dart';

@HiveType(typeId: 3)
class ChapterDto {
  const ChapterDto({
    this.id,
    this.title,
    this.endpoint,
    this.listImage = const [],
    this.mangaEndpoint,
    this.nameManga,
    this.nextChapter,
    this.prevChapter,
    this.isDataLocal = false,
  });

  factory ChapterDto.fromHTML(DartSoup data, String endpoint) {
    final responseData = data.findAll('#content > img');
    final responseLink = data.findAll('.linkchapter > a');

    return ChapterDto(
      id: endpoint.toId,
      title: data.call('header > h1')?.text,
      endpoint: endpoint,
      mangaEndpoint: responseLink[3].attributes['href'],
      listImage: List<ChapterImageDto>.from(
        responseData.mapIndexed<ChapterImageDto>(ChapterImageDto.fromHTML),
      ),
      nameManga: data
          .call('div.al-c.linkchapter.mt20 > a.mr10.ml10')
          ?.attributes['title']
          ?.replaceFirst('truyện tranh', '')
          .trim(),
      prevChapter: data
          .searchListByAttr(id: 'head > link', attr: 'rel', equal: 'Prev')
          ?.attributes['href']
          ?.replaceAll(ENV.webPage, ''),
      nextChapter: data
          .searchListByAttr(id: 'head > link', attr: 'rel', equal: 'Next')
          ?.attributes['href']
          ?.replaceAll(ENV.webPage, ''),
      isDataLocal: false,
    );
  }

  factory ChapterDto.fromEntitie(Chapter chapter) {
    return ChapterDto(
      id: chapter.id,
      title: chapter.title,
      endpoint: chapter.endpoint,
      nameManga: chapter.nameManga,
      mangaEndpoint: chapter.mangaEndpoint,
      listImage: List<ChapterImageDto>.from(
        (chapter.listImage ?? []).map(ChapterImageDto.fromModel),
      ),
      nextChapter: chapter.nextChapter,
      prevChapter: chapter.prevChapter,
      isDataLocal: true,
    );
  }

  Chapter toEntity() {
    return Chapter(
      id: id,
      title: title,
      endpoint: endpoint,
      mangaEndpoint: mangaEndpoint,
      nameManga: nameManga,
      listImage: listImage.toPages(),
      prevChapter: prevChapter,
      nextChapter: nextChapter,
      isDataLocal: isDataLocal,
    );
  }

  String get idManga => mangaEndpoint?.split('/')[1] ?? 'valid';

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? endpoint;
  @HiveField(3)
  final String? mangaEndpoint;
  @HiveField(4)
  final String? nameManga;
  @HiveField(5)
  final List<ChapterImageDto> listImage;
  @HiveField(6)
  final String? prevChapter;
  @HiveField(7)
  final String? nextChapter;
  @HiveField(8)
  final bool isDataLocal;
}

extension ListChapterDtoX on List<ChapterDto> {
  List<Chapter> toEntities() => map((chapter) => chapter.toEntity()).toList();
}
