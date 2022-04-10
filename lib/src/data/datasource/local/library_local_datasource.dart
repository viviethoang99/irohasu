import 'package:hive/hive.dart';
import '../../../domain/entities/manga.dart';

abstract class ILibraryLocalDataSource {
  List<Manga> getListManga();
  List<Manga> getListSearch(String keyword);
  Future<void> removeManga(String id);
}

class LibraryLocalDataSource implements ILibraryLocalDataSource {
  LibraryLocalDataSource(this._box);

  final Box _box;
  
  @override
  List<Manga> getListManga() {
    // TODO: implement getListManga
    throw UnimplementedError();
  }

  @override
  List<Manga> getListSearch(String keyword) {
    // TODO: implement getListSearch
    throw UnimplementedError();
  }

  @override
  Future<void> removeManga(String id) {
    // TODO: implement removeManga
    throw UnimplementedError();
  }
}
