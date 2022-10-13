import 'package:isar/isar.dart';

import '../../../../../core/core.dart';
import '../../../../../env.dart';
import '../../../chapter.dart';

part 'chapter_dto.g.dart';

@collection
class ChapterDto {
  const ChapterDto({
    required this.id,
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
      id: int.tryParse(endpoint.toId.slice(1)) ?? Isar.autoIncrement,
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
      id: int.tryParse(chapter.id ?? 'a') ?? Isar.autoIncrement,
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
      id: 'c$id',
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

  final Id id;
  final String? title;
  final String? endpoint;
  final String? mangaEndpoint;
  final String? nameManga;
  final List<ChapterImageDto> listImage;
  final String? prevChapter;
  final String? nextChapter;
  final bool isDataLocal;
}

extension ListChapterDtoX on List<ChapterDto> {
  List<Chapter> toEntities() => map((chapter) => chapter.toEntity()).toList();
}
