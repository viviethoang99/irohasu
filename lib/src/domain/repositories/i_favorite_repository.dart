import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../usecaes/favorite_manga/change_status_favorite_usercase.dart';

abstract class IFavoriteRepository {
  Future<Either<Failure, bool>> isFavorite(String id);

  Either<Failure, List<String>> getListFavorite();

  Either<Failure, void> changeStatusFavorite({
    ChangeStatusFavoriteParams? params,
  });
}
