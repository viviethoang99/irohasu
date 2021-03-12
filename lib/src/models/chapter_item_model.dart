import 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

part 'chapter_item_model.g.dart';

@HiveType(typeId: 1)
class ChapterItem extends Equatable {
  ChapterItem({
    @required this.idChapter,
    @required this.chapterTitle,
    @required this.chapterEndpoint,
    @required this.chapterUpload,
    this.isDownload,
    this.isReading = false,
  });

  factory ChapterItem.fromJson({Map<String, dynamic> json}) => ChapterItem(
        idChapter: json['idChapter'] as String,
        chapterTitle: json['chapterTitle'] as String,
        chapterEndpoint: json['chapterEndpoint'] as String,
        chapterUpload: DateFormat('dd/MMM/yyyy hh:mm')
            .parse(json['chapterUpload'] as String),
      );

  @HiveField(0)
  final String chapterTitle;
  @HiveField(1)
  final String chapterEndpoint;
  @HiveField(2)
  final DateTime chapterUpload;
  @HiveField(3)
  int _progressReading = 0;
  @HiveField(4)
  bool isReading;
  @HiveField(5)
  String isDownload;
  @HiveField(6)
  final String idChapter;
  @HiveField(7)
  DateTime timeReading;

  int get progressReading => _progressReading;

  set progressReading(int progress) {
    if (progress > 0 && progress > _progressReading)
      _progressReading = progress;
  }

  @override
  List<Object> get props => [
        chapterTitle,
        chapterEndpoint,
        chapterUpload,
        idChapter,
      ];
}
