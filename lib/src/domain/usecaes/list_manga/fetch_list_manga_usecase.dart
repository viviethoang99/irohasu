import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../entities/manga.dart';
import '../../repositories/i_manga_repository.dart';

@lazySingleton
class FetchListMangaUseCase implements UseCase<ListManga, int> {
  const FetchListMangaUseCase(this._repository);

  final IMangaRepository _repository;

  @override
  Future<Either<Failure, ListManga>> call({int? params}) async {
    return _repository.findMangaByPage(page: params!);
  }
}
