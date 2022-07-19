import '../../../../../core/core.dart';
import '../../../../../env.dart';
import '../../../domain/domain.dart';
import 'chapter_image_dto.dart';

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
  });

  factory ChapterDto.fromHTML(DartSoup data, String endpoint) {
    final responseData = data.findAll('#content > img');
    final responseLink = data.findAll('.linkchapter > a');

    return ChapterDto(
      id: endpoint.substring(1),
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
    );
  }

  final String? id;
  final String? title;
  final String? endpoint;
  final String? mangaEndpoint;
  final String? nameManga;
  final List<ChapterImageDto> listImage;
  final String? prevChapter;
  final String? nextChapter;
}
