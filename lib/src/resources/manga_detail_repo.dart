import 'package:dio/dio.dart' as dio;

import '../../src/models/manga_model.dart';
import '../../src/service/base_service.dart';

class MangaDetailRepo extends BaseService {
  Future<MangaModel> fetchMangaDetail(String endpoint) async {
    dio.Response response;
    response = await request(url: endpoint);
    final data =
        MangaModel.fromJsonDetail(response.data['obj'] as Map<String, dynamic>);
    return data;
  }
}
