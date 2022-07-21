import 'package:hive_flutter/hive_flutter.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/chapter_item.dart';

part 'chapter_item_dto.g.dart';

@HiveType(typeId: 1)
class ChapterItemDto {
  const ChapterItemDto({
    required this.id,
    required this.title,
    required this.endpoint,
    required this.createAt,
    this.isDownload = '',
    this.isReading = false,
    this.progressReading = 0,
    this.timeReading,
  });

  factory ChapterItemDto.fromHTML(Element data) {
    final dateTime = data.querySelector('.publishedDate')?.text;
    final dateToString = DateFormat('dd/MM/yyyy hh:mm').parse(dateTime ?? '');
    final endpoint = data.querySelector('.title > a')?.attributes['href'];
    return ChapterItemDto(
      id: endpoint?.substring(2, 8),
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

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? endpoint;
  @HiveField(2)
  final DateTime? createAt;
  @HiveField(3)
  final int progressReading;
  @HiveField(4)
  final bool isReading;
  @HiveField(5)
  final String? isDownload;
  @HiveField(6)
  final String? title;
  @HiveField(7)
  final DateTime? timeReading;
}
