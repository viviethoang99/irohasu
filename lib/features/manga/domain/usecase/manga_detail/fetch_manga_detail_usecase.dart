import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../entities/manga_detail.dart';
import '../../repositories/i_manga_repository.dart';

@lazySingleton
final class FetchMangaDetailUseCase implements UseCase<MangaDetail, String> {
  const FetchMangaDetailUseCase(this._repository);

  final IMangaRepository _repository;

  @override
  Future<Either<Failure, MangaDetail>> call({String? params}) async {
    return _repository.fetchMangaDetail(params!);
  }
}
