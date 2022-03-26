import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/i_favorite_repository.dart';

@lazySingleton
class IsFavoriteUseCase implements UseCase<bool, String> {
  const IsFavoriteUseCase(this._repository);

  final IFavoriteRepository _repository;

  @override
  Future<Either<Failure, bool>> call({String? params}) {
    return _repository.isFavorite(params!);
  }
}
