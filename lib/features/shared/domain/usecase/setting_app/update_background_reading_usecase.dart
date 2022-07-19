import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../repositories/repository.dart';

@lazySingleton
class SetBackgroundReadingUseCase
    extends UseCase<void, SetBackgroundReadingParams> {
  SetBackgroundReadingUseCase(this.repository);

  final ISettingAppRepository repository;

  @override
  Future<Either<Failure, void>> call({SetBackgroundReadingParams? params}) {
    return repository.setBackgroundReading(params!);
  }
}

class SetBackgroundReadingParams {
  const SetBackgroundReadingParams(this.name);

  final String name;
}
