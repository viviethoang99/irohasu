import 'package:html/parser.dart';

import '../models/manga_list_model.dart';
import '../service/base_service.dart';

class ListMangaRepo extends BaseService {
  Future<List<MangaModel>> fetchListManga({int? page}) async {
    final response = await request(url: '/page-$page');
    final document = parse(response!.data);
    final responseData = document.getElementsByClassName('storyitem');
    var data = List<MangaModel>.from(
      responseData.map<MangaModel>((manga) => MangaModel.listManga(manga)),
    );
    return data;
  }
}
