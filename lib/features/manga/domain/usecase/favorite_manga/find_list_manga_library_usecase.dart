import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../entities/manga_detail.dart';
import '../../repositories/i_manga_repository.dart';

@lazySingleton
class FindListMangaLibraryUseCase
    implements UseCase<ListMangaDetail, List<String>> {
  const FindListMangaLibraryUseCase(this._repository);

  final IMangaRepository _repository;

  @override
  Future<Either<Failure, ListMangaDetail>> call({List<String>? params}) {
    final query = params?.map((e) => int.parse(e.slice(1))).toList() ?? <int>[];
    return _repository.findMangaLibrary(query);
  }
}
