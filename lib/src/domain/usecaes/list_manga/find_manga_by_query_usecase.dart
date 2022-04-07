import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../data/model/manga_list_model.dart';
import '../../repositories/i_manga_repository.dart';

@lazySingleton
class FindMangaByQueryUseCase implements UseCase<List<MangaModel>, String> {
  const FindMangaByQueryUseCase(this._repository);

  final IMangaRepository _repository;

  @override
  Future<Either<Failure, List<MangaModel>>> call({String? params}) async {
    return _repository.findMangaByQuery(query: params!);
  }
}
