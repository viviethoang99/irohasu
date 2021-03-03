import 'package:dio/dio.dart' as dio;
import 'package:irohasu/src/models/manga_list_model.dart';

import '../../src/service/base_service.dart';

class ListMangaRepo extends BaseService {
  Future<List<MangaListModel>> fetchListManga({int page}) async {
    dio.Response response;
    response = await request(url: '/api/manga/new/$page');

    var data = List<MangaListModel>.from(
        response.data['manga_list'].map<MangaListModel>(
      (manga) => MangaListModel.fromMap(manga),
    ));

    return data;
  }
}
