// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i12;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/data/datasource/local/favorite_local_source.dart' as _i8;
import '../../src/data/datasource/local/history_local_source.dart' as _i5;
import '../../src/data/datasource/local/setting_local_datasource.dart' as _i11;
import '../../src/data/datasource/remote/chapter_services.dart' as _i4;
import '../../src/data/datasource/remote/manga_services.dart' as _i14;
import '../../src/data/repositories/chapter_repository_imp.dart' as _i7;
import '../../src/data/repositories/favorite_repository.dart' as _i10;
import '../../src/data/repositories/manga_repository_imp.dart' as _i19;
import '../../src/data/repositories/setting_app_repository.dart' as _i21;
import '../../src/domain/repositories/i_chaper_repository.dart' as _i6;
import '../../src/domain/repositories/i_favorite_repository.dart' as _i9;
import '../../src/domain/repositories/i_manga_repository.dart' as _i18;
import '../../src/domain/repositories/i_setting_app_repository.dart' as _i20;
import '../../src/domain/usecaes/chapter/fetch_data_chapter_usecase.dart'
    as _i17;
import '../../src/domain/usecaes/favorite_manga/change_status_favorite_usercase.dart'
    as _i15;
import '../../src/domain/usecaes/favorite_manga/is_favorite_usecase.dart'
    as _i13;
import '../../src/domain/usecaes/list_manga/fetch_list_manga_usecase.dart'
    as _i24;
import '../../src/domain/usecaes/manga_detail/fetch_manga_detail_usecase.dart'
    as _i25;
import '../../src/domain/usecaes/setting_app/get_setting_app_usecase.dart'
    as _i26;
import '../../src/domain/usecaes/setting_app/set_default_setting_app_usecase.dart'
    as _i22;
import '../../src/domain/usecaes/setting_app/update_setting_app_usecase.dart'
    as _i23;
import '../../src/presentation/blocs/change_theme_bloc/change_theme_bloc.dart'
    as _i29;
import '../../src/presentation/blocs/chapter_screen/chapter_screen_cubit.dart'
    as _i30;
import '../../src/presentation/blocs/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i16;
import '../../src/presentation/blocs/list_manga_bloc/list_manga_bloc.dart'
    as _i27;
import '../../src/presentation/blocs/manga_detail_bloc/manga_detail_bloc.dart'
    as _i28;
import 'modules/storage_module.dart'
    as _i31; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i4.ChapterServices>(() => _i4.ChapterServices());
  gh.factory<_i5.HistoryLocalSourceImp>(() => _i5.HistoryLocalSourceImp(
      get<_i3.Box<dynamic>>(instanceName: 'irohasu_iz_bezt_girl')));
  gh.lazySingleton<_i6.IChapterRepository>(
      () => _i7.ChapterRepositoryImp(get<_i4.ChapterServices>()));
  gh.factory<_i8.IFavoriteLocalSource>(() => _i8.FavoriteLocalSource(
      get<_i3.Box<dynamic>>(instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i9.IFavoriteRepository>(
      () => _i10.FavoriteRepository(get<_i8.IFavoriteLocalSource>()));
  gh.factory<_i11.ISettingLocalDataSource>(() => _i11.SettingLocalDataSource(
      get<_i12.Box<dynamic>>(instanceName: 'shared_preferences')));
  gh.lazySingleton<_i13.IsFavoriteUseCase>(
      () => _i13.IsFavoriteUseCase(get<_i9.IFavoriteRepository>()));
  gh.factory<_i14.MangaService>(() => _i14.MangaService());
  gh.lazySingleton<_i15.ChangeStatusFavoriteUseCase>(
      () => _i15.ChangeStatusFavoriteUseCase(get<_i9.IFavoriteRepository>()));
  gh.factoryParam<_i16.FavoriteMangaDetailBloc, String, dynamic>(
      (endpoint, _) => _i16.FavoriteMangaDetailBloc(
          get<_i15.ChangeStatusFavoriteUseCase>(),
          get<_i13.IsFavoriteUseCase>(),
          endpoint));
  gh.lazySingleton<_i17.FetchDataChapterUsecase>(
      () => _i17.FetchDataChapterUsecase(get<_i6.IChapterRepository>()));
  gh.lazySingleton<_i18.IMangaRepository>(
      () => _i19.MangaRepository(get<_i14.MangaService>()));
  gh.factory<_i20.ISettingAppRepository>(
      () => _i21.SettingAppRepository(get<_i11.ISettingLocalDataSource>()));
  gh.lazySingleton<_i22.SetDefaultSettingAppUseCase>(() =>
      _i22.SetDefaultSettingAppUseCase(get<_i20.ISettingAppRepository>()));
  gh.lazySingleton<_i23.SetThemeAppUseCase>(
      () => _i23.SetThemeAppUseCase(get<_i20.ISettingAppRepository>()));
  gh.lazySingleton<_i24.FetchListMangaUseCase>(
      () => _i24.FetchListMangaUseCase(get<_i18.IMangaRepository>()));
  gh.lazySingleton<_i25.FetchMangaDetailUseCase>(
      () => _i25.FetchMangaDetailUseCase(get<_i18.IMangaRepository>()));
  gh.lazySingleton<_i26.GetThemeAppUseCase>(
      () => _i26.GetThemeAppUseCase(get<_i20.ISettingAppRepository>()));
  gh.factory<_i27.ListMangaBloc>(
      () => _i27.ListMangaBloc(get<_i24.FetchListMangaUseCase>()));
  gh.factoryParam<_i28.MangaDetailBloc, String, dynamic>((endpoint, _) =>
      _i28.MangaDetailBloc(endpoint, get<_i25.FetchMangaDetailUseCase>()));
  gh.factory<_i29.ChangeThemeBloc>(() => _i29.ChangeThemeBloc(
      get<_i26.GetThemeAppUseCase>(), get<_i23.SetThemeAppUseCase>()));
  gh.factory<_i30.ChapterScreenCubit>(() => _i30.ChapterScreenCubit(
      get<_i17.FetchDataChapterUsecase>(),
      repository: get<_i6.IChapterRepository>(),
      mangaDetailBloc: get<_i28.MangaDetailBloc>()));
  return get;
}

class _$StorageModule extends _i31.StorageModule {}
