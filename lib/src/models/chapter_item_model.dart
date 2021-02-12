import 'package:intl/intl.dart';
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
    this.progress = 0,
  });

  factory ChapterItem.fromJson({Map<String, dynamic> json}) {
    // print(DateFormat('dd/MMM/yyyy hh:mm').parse(json['chapterUpload'] as String));
    return ChapterItem(
      chapterTitle: json['chapterTitle'] as String,
      chapterEndpoint: json['chapterEndpoint'] as String,
      chapterUpload: DateFormat('dd/MMM/yyyy hh:mm')
          .parse(json['chapterUpload'] as String),
    );
  }

  @HiveField(0)
  final String chapterTitle;
  @HiveField(1)
  final String chapterEndpoint;
  @HiveField(2)
  final DateTime chapterUpload;
  @HiveField(3)
  final int progress;

  @override
  List<Object> get props => [chapterTitle, chapterEndpoint, chapterUpload];
}
