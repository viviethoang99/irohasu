// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i9;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/data/datasource/local/favorite_local_source.dart' as _i5;
import '../../src/data/datasource/local/history_local_source.dart' as _i4;
import '../../src/data/datasource/local/setting_local_datasource.dart' as _i8;
import '../../src/data/datasource/remote/manga_services.dart' as _i11;
import '../../src/data/repositories/favorite_repository.dart' as _i7;
import '../../src/data/repositories/manga_repository_imp.dart' as _i15;
import '../../src/data/repositories/setting_app_repository.dart' as _i17;
import '../../src/domain/repositories/i_favorite_repository.dart' as _i6;
import '../../src/domain/repositories/i_manga_repository.dart' as _i14;
import '../../src/domain/repositories/i_setting_app_repository.dart' as _i16;
import '../../src/domain/usecaes/favorite_manga/change_status_favorite_usercase.dart'
    as _i12;
import '../../src/domain/usecaes/favorite_manga/is_favorite_usecase.dart'
    as _i10;
import '../../src/domain/usecaes/manga_detail/fetch_manga_detail_usecase.dart'
    as _i20;
import '../../src/domain/usecaes/setting_app/get_setting_app_usecase.dart'
    as _i21;
import '../../src/domain/usecaes/setting_app/set_default_setting_app_usecase.dart'
    as _i18;
import '../../src/domain/usecaes/setting_app/update_setting_app_usecase.dart'
    as _i19;
import '../../src/presentation/blocs/change_theme_bloc/change_theme_bloc.dart'
    as _i23;
import '../../src/presentation/blocs/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i13;
import '../../src/presentation/blocs/manga_detail_bloc/manga_detail_bloc.dart'
    as _i22;
import 'modules/storage_module.dart'
    as _i24; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i5.IFavoriteLocalSource>(() => _i5.FavoriteLocalSource(
      get<_i3.Box<dynamic>>(instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i6.IFavoriteRepository>(
      () => _i7.FavoriteRepository(get<_i5.IFavoriteLocalSource>()));
  gh.factory<_i8.ISettingLocalDataSource>(() => _i8.SettingLocalDataSource(
      get<_i9.Box<dynamic>>(instanceName: 'shared_preferences')));
  gh.lazySingleton<_i10.IsFavoriteUseCase>(
      () => _i10.IsFavoriteUseCase(get<_i6.IFavoriteRepository>()));
  gh.factory<_i11.MangaService>(() => _i11.MangaService());
  gh.lazySingleton<_i12.ChangeStatusFavoriteUseCase>(
      () => _i12.ChangeStatusFavoriteUseCase(get<_i6.IFavoriteRepository>()));
  gh.factoryParam<_i13.FavoriteMangaDetailBloc, String, dynamic>(
      (endpoint, _) => _i13.FavoriteMangaDetailBloc(
          get<_i12.ChangeStatusFavoriteUseCase>(),
          get<_i10.IsFavoriteUseCase>(),
          endpoint));
  gh.lazySingleton<_i14.IMangaRepository>(() => _i15.MangaRepository(
      get<_i11.MangaService>(), get<_i4.HistoryLocalSourceImp>()));
  gh.factory<_i16.ISettingAppRepository>(
      () => _i17.SettingAppRepository(get<_i8.ISettingLocalDataSource>()));
  gh.lazySingleton<_i18.SetDefaultSettingAppUseCase>(() =>
      _i18.SetDefaultSettingAppUseCase(get<_i16.ISettingAppRepository>()));
  gh.lazySingleton<_i19.SetThemeAppUseCase>(
      () => _i19.SetThemeAppUseCase(get<_i16.ISettingAppRepository>()));
  gh.lazySingleton<_i20.FetchMangaDetailUseCase>(
      () => _i20.FetchMangaDetailUseCase(get<_i14.IMangaRepository>()));
  gh.lazySingleton<_i21.GetThemeAppUseCase>(
      () => _i21.GetThemeAppUseCase(get<_i16.ISettingAppRepository>()));
  gh.factoryParam<_i22.MangaDetailBloc, String, dynamic>((endpoint, _) =>
      _i22.MangaDetailBloc(endpoint, get<_i20.FetchMangaDetailUseCase>()));
  gh.factory<_i23.ChangeThemeBloc>(() => _i23.ChangeThemeBloc(
      get<_i21.GetThemeAppUseCase>(), get<_i19.SetThemeAppUseCase>()));
  return get;
}

class _$StorageModule extends _i24.StorageModule {}
