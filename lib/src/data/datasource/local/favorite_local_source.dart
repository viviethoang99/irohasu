import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

const String _kFavoriteManga = 'CACHE_LIST_MANGA_USER_FAVORITE';

abstract class IFavoriteLocalSource {
  Future<bool> isFavorite(String id);

  List<String> getListFavorite();

  void deleteFromFavoriteList(String id);

  void addToFavoriteList(String id);

  Stream<List<String>> watchListIdFavorite();
}

@Injectable(as: IFavoriteLocalSource)
class FavoriteLocalSource implements IFavoriteLocalSource {
  const FavoriteLocalSource(
    @Named('favorite_box') this._box,
  );

  final Box<List<String>> _box;

  @override
  Future<bool> isFavorite(String id) async {
    final listBook = getListFavorite();

    return listBook.contains(id);
  }

  @override
  List<String> getListFavorite() {
    return _box.get(_kFavoriteManga) ?? <String>[];
  }

  @override
  void addToFavoriteList(String id) {
    final listBox = getListFavorite()..add(id);
    _box.put(_kFavoriteManga, listBox);
  }

  @override
  void deleteFromFavoriteList(String id) {
    final listBox = getListFavorite()..removeWhere((item) => id == item);
    _box.put(_kFavoriteManga, listBox);
  }

  @override
  Stream<List<String>> watchListIdFavorite() {
    return _box
        .watch(key: _kFavoriteManga)
        .map((_) => getListFavorite());
  }
}
