import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../entities/manga.dart';
import '../../repositories/i_manga_repository.dart';

@lazySingleton
class FindMangaByQueryUseCase implements UseCase<ListManga, String> {
  const FindMangaByQueryUseCase(this._repository);

  final IMangaRepository _repository;

  @override
  Future<Either<Failure, ListManga>> call({String? params}) async {
    return _repository.findMangaByQuery(query: params!);
  }
}
