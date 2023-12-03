import 'package:equatable/equatable.dart';

typedef ListChapter = List<ChapterItem>;

final class ChapterItem extends Equatable {
  const ChapterItem({
    required this.id,
    required this.title,
    required this.endpoint,
    required this.createAt,
    this.isDownload = '',
    this.isReading = false,
    this.progressReading = 0,
    this.timeReading,
  });

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
  final int progressReading;
  final bool isReading;
  final String? isDownload;
  final String? title;
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
