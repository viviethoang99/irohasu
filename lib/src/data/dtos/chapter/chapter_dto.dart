import 'package:html/dom.dart';

import '../../../../core/core.dart';
import '../../../domain/entities/chapter.dart';
import 'chapter_image_dto.dart';

class ChapterDto {
  const ChapterDto({
    this.id,
    this.title,
    this.endpoint,
    this.listImage = const [],
    this.mangaEndpoint,
    this.nameManga,
  });

  factory ChapterDto.fromHTML(Document data, String endpoint) {
    final responseData = data.querySelectorAll('#content > img');
    final responseLink = data.querySelectorAll('.linkchapter > a');
    return ChapterDto(
      id: endpoint.substring(1),
      title: data.querySelector('header > h1')?.text,
      endpoint: endpoint,
      mangaEndpoint: responseLink[3].attributes['href'],
      listImage: List<ChapterImageDto>.from(
        responseData.mapIndexed<ChapterImageDto>(ChapterImageDto.fromHTML),
      ),
      nameManga: data
          .querySelector('div.al-c.linkchapter.mt20 > a.mr10.ml10')
          ?.attributes['title']
          ?.replaceFirst('truyện tranh', '')
          .trim(),
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
    );
  }

  final String? id;
  final String? title;
  final String? endpoint;
  final String? mangaEndpoint;
  final String? nameManga;
  final List<ChapterImageDto> listImage;
}
