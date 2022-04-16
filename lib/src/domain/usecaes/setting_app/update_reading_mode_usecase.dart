import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../repositories/i_setting_app_repository.dart';

@lazySingleton
class SetReadingModeUseCase extends UseCase<void, SetReadingModeParams> {
  SetReadingModeUseCase(this.repository);

  final ISettingAppRepository repository;

  @override
  Future<Either<Failure, void>> call({SetReadingModeParams? params}) {
    return repository.setReadingMode(params!);
  }
}


class SetReadingModeParams {
  const SetReadingModeParams(this.name);

  final String name;
}
