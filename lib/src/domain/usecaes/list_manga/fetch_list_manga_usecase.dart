import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../data/model/manga_list_model.dart';
import '../../repositories/i_manga_repository.dart';

@lazySingleton
class FetchListMangaUseCase implements UseCase<List<MangaModel>, int> {
  const FetchListMangaUseCase(this._repository);

  final IMangaRepository _repository;

  @override
  Future<Either<Failure, List<MangaModel>>> call({int? params}) async {
    return _repository.fetchListManga(page: params!);
  }
}
