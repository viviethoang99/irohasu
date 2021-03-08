import 'package:dio/dio.dart' as dio;

import '../../src/models/manga_detail_model.dart';
import '../../src/service/base_service.dart';

class MangaDetailRepo extends BaseService {
  Future<MangaDetailModel> fetchMangaDetail(String endpoint) async {
    dio.Response response;
    response = await request(url: endpoint);
    final data = MangaDetailModel.fromMap(response.data['obj']);
    // print(data.listGenres.length);
    return data;
  }
}
