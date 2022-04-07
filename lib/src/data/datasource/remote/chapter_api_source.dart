import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';
import '../../model/chapter/chapter_model.dart';

/// A class responsible for fetching chapter data from website using an
abstract class IChapterApiSource {
  /// Returns an list [ChapterModel] by fetching it from the website
  /// HTTP call with the [endpoint].
  Future<ChapterModel> findMangaDetail(String? endpoint);
}

@injectable
class ChapterApiSource {
  const ChapterApiSource(this._dio);

  final Dio _dio;

  Future<ChapterModel> getDataChapter(String endpoint) async {
    final response = await _dio.get(endpoint);
    final document = parse(response.data);
    final data = ChapterModel.fromHTML(document, endpoint);
    return data;
  }
}
