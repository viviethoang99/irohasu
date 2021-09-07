import 'package:html/parser.dart';

import '../models/chapter_model.dart';
import 'base_service.dart';

class ChapterServices extends BaseService {
  Future<ChapterModel> getDataChapter(String endpoint) async {
    final response = await request(url: endpoint);
    final document = parse(response?.data);
    final data = ChapterModel.fromData(document, endpoint);
    return data;
  }
}
