import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../repositories/i_setting_app_repository.dart';

@lazySingleton
class SetThemeAppUseCase extends UseCase<void, SetThemeAppParams> {
  SetThemeAppUseCase(this.repository);

  final ISettingAppRepository repository;

  @override
  Future<Either<Failure, void>> call({SetThemeAppParams? params}) {
    return repository.setThemeApp(params!);
  }
}

class SetThemeAppParams {
  SetThemeAppParams(this.model);

  final String model;
}
