import '../models/manga_list_model.dart';
import '../service/base_service.dart';

class SearchRepo extends BaseService {
  Future<List<MangaListModel>> getDataResult({String query}) async {
    final response = await request(url: '/api/search/$query');
    var data = List<MangaListModel>.from((response.data['manga_list'])
        .map<MangaListModel>((manga) => MangaListModel.fromMap(manga)));
    return data;
  }
}
