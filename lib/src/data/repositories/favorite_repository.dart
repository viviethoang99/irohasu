import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/repositories/i_favorite_repository.dart';
import '../../domain/usecaes/favorite_manga/change_status_favorite_usercase.dart';
import '../datasource/local/favorite_local_source.dart';

@Injectable(as: IFavoriteRepository)
class FavoriteRepository implements IFavoriteRepository {
  const FavoriteRepository(this._localSource);

  final IFavoriteLocalSource _localSource;

  @override
  Either<Failure, void> changeStatusFavorite({
    ChangeStatusFavoriteParams? params,
  }) {
    try {
      params!.isFavorite
          ? _localSource.deleteFromFavoriteList(params.id)
          : _localSource.addToFavoriteList(params.id);
      return const Right(null);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Either<Failure, List<String>> getListFavorite() {
    try {
      final result = _localSource.getListFavorite();
      return Right(result);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(String id) async {
    try {
      final result = await _localSource.isFavorite(id);
      return Right(result);
    } on CacheException {
      throw CacheException();
    }
  }
}
