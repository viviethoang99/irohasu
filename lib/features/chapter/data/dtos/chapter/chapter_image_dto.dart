import 'package:hive/hive.dart';
import 'package:html/dom.dart';

import '../../../domain/entities/chapter.dart';

part 'chapter_image_dto.g.dart';

typedef ListPageDto = List<ChapterImageDto>;

@HiveType(typeId: 4)
class ChapterImageDto {
  const ChapterImageDto({
    required this.urlImage,
    required this.number,
  });

  factory ChapterImageDto.fromHTML(Element data, int index) {
    return ChapterImageDto(
      number: index,
      urlImage: data.attributes['src'],
    );
  }

  ChapterImage toModel() {
    return ChapterImage(
      number: number,
      urlImage: urlImage,
    );
  }

  @HiveField(0)
  final String? urlImage;
  @HiveField(1)
  final int? number;
}

extension ListPageDtoX on ListPageDto {
  ListPage toPages() => map((page) => page.toModel()).toList();
}
