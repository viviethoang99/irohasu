import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

part 'chapter_item_model.g.dart';

@HiveType(typeId: 1)
class ChapterItem extends Equatable {
  ChapterItem({
    required this.id,
    required this.title,
    required this.endpoint,
    required this.createAt,
    this.isDownload = '',
    this.isReading = false,
    this.progressReading = 0,
    this.timeReading,
  });

  factory ChapterItem.fromMap({required Element data}) {
    final dateTime = data.querySelector('.publishedDate')?.text;
    final dateToString = DateFormat('dd/MM/yyyy hh:mm').parse(dateTime ?? '');
    final endpoint = data.querySelector('.title > a')?.attributes['href'];
    return ChapterItem(
      id: endpoint?.substring(2, 8),
      title: data.querySelector('.title > a')?.text,
      endpoint: endpoint,
      createAt: dateToString,
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

  @override
  List<Object?> get props => [
        id,
        title,
        endpoint,
        createAt,
        progressReading,
        isReading,
        isDownload,
        timeReading,
      ];
}
