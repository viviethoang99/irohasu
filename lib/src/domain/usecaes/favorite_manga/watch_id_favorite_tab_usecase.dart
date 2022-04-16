import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../repositories/i_favorite_repository.dart';

@lazySingleton
class WatchIdFavoriteTabUseCase
    extends UseCase<Stream<List<String>>, NoParams> {
  WatchIdFavoriteTabUseCase(this._repository);

  final IFavoriteRepository _repository;

  @override
  Future<Either<Failure, Stream<List<String>>>> call({NoParams? params}) async {
    return _repository.watchListFavorite();
  }
}
