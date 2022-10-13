import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../download.dart';

@lazySingleton
class DeleteMangaUsecase extends UseCase<void, String> {
  DeleteMangaUsecase(
    this._downloadRepository,
  );

  final IDownloadRepository _downloadRepository;

  @override
  FutureOr<Either<Failure, void>> call({String? params}) async {
    final idChapter = params?.toId;
    if (idChapter == null) return Left(ParamsFailure());
    try {
      await _downloadRepository.deleteManga(idChapter);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
