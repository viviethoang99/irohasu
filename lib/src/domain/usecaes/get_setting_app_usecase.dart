import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';

import '../../data/model/setting_model/setting_app.dart';
import '../repositories/i_setting_app_repository.dart';

class GetSettingAppUseCase implements UseCase<SettingApp, void> {
  GetSettingAppUseCase(this.repository);

  final ISettingAppRepository repository;

  @override
  Future<Either<Failure, SettingApp>> call({void params}) {
    return repository.getSetting();
  }
}
