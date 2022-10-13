import 'package:html/dom.dart';
import 'package:isar/isar.dart';

import '../../../domain/entities/chapter.dart';

part 'chapter_image_dto.g.dart';

typedef ListPageDto = List<ChapterImageDto>;

@embedded
class ChapterImageDto {
  const ChapterImageDto({
    this.urlImage,
    this.number,
  });

  factory ChapterImageDto.fromHTML(Element data, int index) {
    return ChapterImageDto(
      number: index,
      urlImage: data.attributes['src'],
    );
  }

  factory ChapterImageDto.fromModel(ChapterImage image) {
    return ChapterImageDto(
      number: image.number,
      urlImage: image.urlImage,
    );
  }

  ChapterImage toModel() {
    return ChapterImage(
      number: number,
      urlImage: urlImage,
    );
  }

  final String? urlImage;
  final int? number;
}

extension ListPageDtoX on ListPageDto {
  ListPage toPages() => map((page) => page.toModel()).toList();
}
