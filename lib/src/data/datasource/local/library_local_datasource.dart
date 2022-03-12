import 'package:hive/hive.dart';
import '../../model/manga_list_model.dart';

abstract class ILibraryLocalDataSource {
  List<MangaModel> getListManga();
  List<MangaModel> getListSearch(String keyword);
  Future<void> removeManga(String id);
}

class LibraryLocalDataSource implements ILibraryLocalDataSource {
  LibraryLocalDataSource(this._box);

  final Box _box;
  
  @override
  List<MangaModel> getListManga() {
    // TODO: implement getListManga
    throw UnimplementedError();
  }

  @override
  List<MangaModel> getListSearch(String keyword) {
    // TODO: implement getListSearch
    throw UnimplementedError();
  }

  @override
  Future<void> removeManga(String id) {
    // TODO: implement removeManga
    throw UnimplementedError();
  }
}
