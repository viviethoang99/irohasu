import 'package:dio/dio.dart' as dio;
import 'package:irohasu/src/models/manga_model.dart';
import 'package:irohasu/src/service/base_service.dart';

class SearchRepo extends BaseService {
  Future<List<MangaModel>> getDataResult({String query}) async {
    dio.Response response;
    response = await request(url: '/api/search/$query');

    var data = List<MangaModel>.from(
        (response.data['manga_list'] as List<dynamic>).map<MangaModel>(
            (dynamic manga) =>
                MangaModel.fromJsonGeneral(manga as Map<String, dynamic>)));
    return data;
  }
}
