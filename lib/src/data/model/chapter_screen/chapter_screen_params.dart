import '../../../domain/entities/chapter_item.dart';

class ChapterScreenParams {
  const ChapterScreenParams({
    required this.endpoint,
    required this.listChap,
    required this.name,
  });

  final String endpoint;
  final List<ChapterItem> listChap;
  final String name;
}
