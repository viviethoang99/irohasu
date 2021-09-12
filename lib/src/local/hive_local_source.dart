abstract class HiveLocalSource {
  Future<List> getList({String idManga});

  Future addList({List listData, String idManga});

  Future removeItem({String idManga, String idChapter});

  Future<void> removeList({String idManga});

  Future<void> removeAll();
}
