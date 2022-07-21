import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../repositories/i_favorite_repository.dart';

@lazySingleton
class ChangeStatusFavoriteUseCase
    implements UseCase<void, ChangeStatusFavoriteParams> {
  const ChangeStatusFavoriteUseCase(this._repository);

  final IFavoriteRepository _repository;

  @override
  Future<Either<Failure, void>> call(
      {ChangeStatusFavoriteParams? params}) async {
    return _repository.changeStatusFavorite(params: params);
  }
}

class ChangeStatusFavoriteParams {
  const ChangeStatusFavoriteParams({
    required this.id,
    required this.isFavorite,
  });

  final bool isFavorite;
  final String id;
}
