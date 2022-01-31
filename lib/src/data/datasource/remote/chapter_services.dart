import 'package:html/parser.dart';
import '../../model/chapter/chapter_model.dart';

import 'base_service.dart';

class ChapterServices extends BaseService {
  Future<ChapterModel> getDataChapter(String endpoint) async {
    final response = await request(url: endpoint);
    final document = parse(response?.data);
    final data = ChapterModel.fromHTML(document, endpoint);
    return data;
  }
}
