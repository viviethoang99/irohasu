import 'package:dio/dio.dart' as dio;

import '../../src/models/manga_model.dart';
import '../../src/service/base_service.dart';

class ListMangaRepo extends BaseService {
  Future<List<MangaModel>> fetchListManga({int page}) async {
    dio.Response response;
    response = await request(url: '/api/manga/new/$page');

    var data = List<MangaModel>.from(
        (response.data['manga_list'] as List<dynamic>).map<MangaModel>(
      (dynamic manga) =>
          MangaModel.fromJsonGeneral(manga as Map<String, dynamic>),
    ));

    return data;
  }
}
