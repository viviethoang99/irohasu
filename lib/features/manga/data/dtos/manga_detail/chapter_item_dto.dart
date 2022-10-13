import 'package:html/dom.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../../../domain/entities/chapter_item.dart';

part 'chapter_item_dto.g.dart';

@embedded
class ChapterItemDto {
  const ChapterItemDto({
    this.id,
    this.title,
    this.endpoint,
    this.createAt,
  });

  factory ChapterItemDto.fromHTML(Element data) {
    final dateTime = data.querySelector('.publishedDate')?.text;
    final dateToString = DateFormat('dd/MM/yyyy hh:mm').parse(dateTime ?? '');
    final endpoint = data.querySelector('.title > a')?.attributes['href'];
    return ChapterItemDto(
      id: endpoint?.split('/')[1],
      title: data.querySelector('.title > a')?.text,
      endpoint: endpoint,
      createAt: dateToString,
    );
  }

  ChapterItem toModel() {
    return ChapterItem(
      id: id,
      title: title,
      endpoint: endpoint,
      createAt: createAt,
    );
  }

  final String? id;
  final String? endpoint;
  final DateTime? createAt;
  final String? title;
}
