import 'package:dio/dio.dart' as dio;

import '../../src/models/chapter_model.dart';
import '../../src/service/base_service.dart';

class ChapterRepo extends BaseService {
  Future<ChapterModel> getDataChapter(String endpoint) async {
    dio.Response? response;
    response = await request(url: endpoint);
    var data = ChapterModel.fromJson(response!.data as Map<String, dynamic>);
    return data;
  }
}
