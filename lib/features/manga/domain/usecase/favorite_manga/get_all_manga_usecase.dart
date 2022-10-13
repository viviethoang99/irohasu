import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../entities/manga_detail.dart';
import '../../repositories/i_manga_repository.dart';

@lazySingleton
class GetAllMangaUseCase implements UseCase<ListMangaDetail, void> {
  const GetAllMangaUseCase(this._repository);

  final IMangaRepository _repository;

  @override
  Future<Either<Failure, ListMangaDetail>> call({void params}) {
    return _repository.findMangaByOffset();
  }
}
