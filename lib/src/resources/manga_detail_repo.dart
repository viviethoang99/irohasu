import 'package:dio/dio.dart' as dio;

import '../models/manga_detail_model.dart';
import '../service/base_service.dart';

class MangaDetailRepo extends BaseService {
  Future<MangaDetailModel?> fetchMangaDetail(String endpoint) async {
    try {
      dio.Response? response;
      response = await request(url: endpoint);
      if(response!.statusCode == 200) {
        final data = MangaDetailModel.fromMap(response.data['obj']);
        return data;
      }
      return null;
    } catch(e) {
      return null;
    }
  }
}
