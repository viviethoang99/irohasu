// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i6;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/local/history_local_source_imp.dart' as _i4;
import '../../data/datasource/local/manga_local_source_imp.dart' as _i7;
import '../../data/datasource/local/setting_local_datasource.dart' as _i5;
import '../../data/datasource/remote/manga_services.dart' as _i8;
import '../../data/repositories/manga_repository_imp.dart' as _i10;
import '../../data/repositories/setting_app_repository.dart' as _i12;
import '../../domain/repositories/i_setting_app_repository.dart' as _i11;
import '../../domain/repositories/manga_repository.dart' as _i9;
import '../../domain/usecaes/get_setting_app_usecase.dart' as _i15;
import '../../domain/usecaes/set_default_setting_app_usecase.dart' as _i13;
import '../../domain/usecaes/update_setting_app_usecase.dart' as _i14;
import '../../presentation/blocs/change_theme_bloc/change_theme_bloc.dart'
    as _i16;
import 'modules/storage_module.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $registerDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final storageModule = _$StorageModule();
  await gh.lazySingletonAsync<_i3.Box<dynamic>>(
      () => storageModule.listMangaBox,
      instanceName: 'irohasu_iz_bezt_girl',
      preResolve: true);
  await gh.lazySingletonAsync<_i3.Box<dynamic>>(() => storageModule.settingBox,
      instanceName: 'shared_preferences', preResolve: true);
  gh.factory<_i4.HistoryLocalSourceImp>(() => _i4.HistoryLocalSourceImp(
      get<_i3.Box<dynamic>>(instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i5.ISettingLocalDataSource>(() => _i5.SettingLocalDataSource(
      get<_i6.Box<dynamic>>(instanceName: 'shared_preferences')));
  gh.factory<_i7.MangaLocalSourceImp>(() => _i7.MangaLocalSourceImp(
      get<_i3.Box<dynamic>>(instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i8.MangaService>(() => _i8.MangaService());
  gh.lazySingleton<_i9.IMangaRepository>(() => _i10.MangaRepositoryImp(
      get<_i8.MangaService>(),
      get<_i4.HistoryLocalSourceImp>(),
      get<_i7.MangaLocalSourceImp>()));
  gh.factory<_i11.ISettingAppRepository>(
      () => _i12.SettingAppRepository(get<_i5.ISettingLocalDataSource>()));
  gh.lazySingleton<_i13.SetDefaultSettingAppUseCase>(() =>
      _i13.SetDefaultSettingAppUseCase(get<_i11.ISettingAppRepository>()));
  gh.lazySingleton<_i14.SetThemeAppUseCase>(
      () => _i14.SetThemeAppUseCase(get<_i11.ISettingAppRepository>()));
  gh.lazySingleton<_i15.GetThemeAppUseCase>(
      () => _i15.GetThemeAppUseCase(get<_i11.ISettingAppRepository>()));
  gh.factory<_i16.ChangeThemeBloc>(() => _i16.ChangeThemeBloc(
      get<_i15.GetThemeAppUseCase>(), get<_i14.SetThemeAppUseCase>()));
  return get;
}

class _$StorageModule extends _i17.StorageModule {}
