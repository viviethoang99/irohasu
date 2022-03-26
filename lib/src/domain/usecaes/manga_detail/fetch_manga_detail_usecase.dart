import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../data/model/manga_detail_model.dart';
import '../../repositories/i_manga_repository.dart';

@lazySingleton
class FetchMangaDetailUseCase implements UseCase<MangaDetailModel, String> {
  const FetchMangaDetailUseCase(this._repository);

  final IMangaRepository _repository;

  @override
  Future<Either<Failure, MangaDetailModel>> call({String? params}) async {
    return _repository.fetchMangaDetail(params!);
  }
}
