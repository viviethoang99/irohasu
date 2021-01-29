import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

part 'chapter_item_model.g.dart';

@HiveType(typeId: 1)
class ChapterItem extends Equatable {
  ChapterItem({
    @required this.chapterTitle,
    @required this.chapterEndpoint,
    @required this.chapterUpload,
    this.progress,
  });

  @HiveField(0)
  final String chapterTitle;
  @HiveField(1)
  final String chapterEndpoint;
  @HiveField(2)
  final DateTime chapterUpload;
  @HiveField(3)
  int progress = 0;

  @override
  List<Object> get props => [chapterTitle, chapterEndpoint, chapterUpload];
}