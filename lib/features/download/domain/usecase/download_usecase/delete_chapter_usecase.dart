import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../download.dart';

@lazySingleton
class DeleteChapUsecase extends UseCase<void, String> {
  DeleteChapUsecase(
    this._downloadRepository,
  );

  final IDownloadRepository _downloadRepository;

  @override
  FutureOr<Either<Failure, void>> call({String? params}) async {
    try {
      final idChapter = params!.toId;
      await _downloadRepository.deleteChapter(idChapter);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
