// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i13;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/data/datasource/local/favorite_local_source.dart' as _i9;
import '../../src/data/datasource/local/history_local_source.dart' as _i6;
import '../../src/data/datasource/local/setting_local_datasource.dart' as _i12;
import '../../src/data/datasource/remote/chapter_services.dart' as _i5;
import '../../src/data/datasource/remote/manga_services.dart' as _i15;
import '../../src/data/model/manga_detail_model.dart' as _i4;
import '../../src/data/repositories/chapter_repository_imp.dart' as _i8;
import '../../src/data/repositories/favorite_repository.dart' as _i11;
import '../../src/data/repositories/manga_repository_imp.dart' as _i20;
import '../../src/data/repositories/setting_app_repository.dart' as _i22;
import '../../src/domain/repositories/i_chaper_repository.dart' as _i7;
import '../../src/domain/repositories/i_favorite_repository.dart' as _i10;
import '../../src/domain/repositories/i_manga_repository.dart' as _i19;
import '../../src/domain/repositories/i_setting_app_repository.dart' as _i21;
import '../../src/domain/usecaes/chapter/fetch_data_chapter_usecase.dart'
    as _i18;
import '../../src/domain/usecaes/favorite_manga/change_status_favorite_usercase.dart'
    as _i16;
import '../../src/domain/usecaes/favorite_manga/is_favorite_usecase.dart'
    as _i14;
import '../../src/domain/usecaes/list_manga/fetch_list_manga_usecase.dart'
    as _i27;
import '../../src/domain/usecaes/manga_detail/fetch_manga_detail_usecase.dart'
    as _i28;
import '../../src/domain/usecaes/setting_app/get_background_reading_usecase.dart'
    as _i29;
import '../../src/domain/usecaes/setting_app/get_reading_mode_usecase.dart'
    as _i30;
import '../../src/domain/usecaes/setting_app/get_setting_app_usecase.dart'
    as _i31;
import '../../src/domain/usecaes/setting_app/set_default_setting_app_usecase.dart'
    as _i24;
import '../../src/domain/usecaes/setting_app/update_background_reading_usecase.dart'
    as _i23;
import '../../src/domain/usecaes/setting_app/update_reading_mode_usecase.dart'
    as _i25;
import '../../src/domain/usecaes/setting_app/update_setting_app_usecase.dart'
    as _i26;
import '../../src/presentation/blocs/change_background_color_bloc/change_background_bloc.dart'
    as _i34;
import '../../src/presentation/blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart'
    as _i35;
import '../../src/presentation/blocs/change_theme_bloc/change_theme_bloc.dart'
    as _i36;
import '../../src/presentation/blocs/chapter_screen/chapter_screen_cubit.dart'
    as _i37;
import '../../src/presentation/blocs/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i17;
import '../../src/presentation/blocs/list_manga_bloc/list_manga_bloc.dart'
    as _i32;
import '../../src/presentation/blocs/manga_detail_bloc/manga_detail_bloc.dart'
    as _i33;
import 'modules/storage_module.dart'
    as _i38; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $registerDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final storageModule = _$StorageModule();
  await gh.lazySingletonAsync<_i3.Box<_i4.MangaDetailModel>>(
      () => storageModule.listMangaBox,
      instanceName: 'irohasu_iz_bezt_girl',
      preResolve: true);
  await gh.lazySingletonAsync<_i3.Box<String>>(() => storageModule.settingBox,
      instanceName: 'setting_box', preResolve: true);
  await gh.lazySingletonAsync<_i3.Box<List<String>>>(
      () => storageModule.favoriteBox,
      instanceName: 'favorite_box',
      preResolve: true);
  gh.factory<_i5.ChapterServices>(() => _i5.ChapterServices());
  gh.factory<_i6.HistoryLocalSourceImp>(() => _i6.HistoryLocalSourceImp(
      get<_i3.Box<_i4.MangaDetailModel>>(
          instanceName: 'irohasu_iz_bezt_girl')));
  gh.lazySingleton<_i7.IChapterRepository>(
      () => _i8.ChapterRepositoryImp(get<_i5.ChapterServices>()));
  gh.factory<_i9.IFavoriteLocalSource>(() => _i9.FavoriteLocalSource(
      get<_i3.Box<List<String>>>(instanceName: 'favorite_box')));
  gh.factory<_i10.IFavoriteRepository>(
      () => _i11.FavoriteRepository(get<_i9.IFavoriteLocalSource>()));
  gh.factory<_i12.ISettingLocalDataSource>(() => _i12.SettingLocalDataSource(
      get<_i13.Box<String>>(instanceName: 'setting_box')));
  gh.lazySingleton<_i14.IsFavoriteUseCase>(
      () => _i14.IsFavoriteUseCase(get<_i10.IFavoriteRepository>()));
  gh.factory<_i15.MangaService>(() => _i15.MangaService());
  gh.lazySingleton<_i16.ChangeStatusFavoriteUseCase>(
      () => _i16.ChangeStatusFavoriteUseCase(get<_i10.IFavoriteRepository>()));
  gh.factoryParam<_i17.FavoriteMangaDetailBloc, String, dynamic>(
      (endpoint, _) => _i17.FavoriteMangaDetailBloc(
          get<_i16.ChangeStatusFavoriteUseCase>(),
          get<_i14.IsFavoriteUseCase>(),
          endpoint));
  gh.lazySingleton<_i18.FetchDataChapterUsecase>(
      () => _i18.FetchDataChapterUsecase(get<_i7.IChapterRepository>()));
  gh.lazySingleton<_i19.IMangaRepository>(
      () => _i20.MangaRepository(get<_i15.MangaService>()));
  gh.factory<_i21.ISettingAppRepository>(
      () => _i22.SettingAppRepository(get<_i12.ISettingLocalDataSource>()));
  gh.lazySingleton<_i23.SetBackgroundReadingUseCase>(() =>
      _i23.SetBackgroundReadingUseCase(get<_i21.ISettingAppRepository>()));
  gh.lazySingleton<_i24.SetDefaultSettingAppUseCase>(() =>
      _i24.SetDefaultSettingAppUseCase(get<_i21.ISettingAppRepository>()));
  gh.lazySingleton<_i25.SetReadingModeUseCase>(
      () => _i25.SetReadingModeUseCase(get<_i21.ISettingAppRepository>()));
  gh.lazySingleton<_i26.SetThemeAppUseCase>(
      () => _i26.SetThemeAppUseCase(get<_i21.ISettingAppRepository>()));
  gh.lazySingleton<_i27.FetchListMangaUseCase>(
      () => _i27.FetchListMangaUseCase(get<_i19.IMangaRepository>()));
  gh.lazySingleton<_i28.FetchMangaDetailUseCase>(
      () => _i28.FetchMangaDetailUseCase(get<_i19.IMangaRepository>()));
  gh.lazySingleton<_i29.GetBackgroundReadingUseCase>(() =>
      _i29.GetBackgroundReadingUseCase(get<_i21.ISettingAppRepository>()));
  gh.lazySingleton<_i30.GetReadingModeUseCase>(
      () => _i30.GetReadingModeUseCase(get<_i21.ISettingAppRepository>()));
  gh.lazySingleton<_i31.GetThemeAppUseCase>(
      () => _i31.GetThemeAppUseCase(get<_i21.ISettingAppRepository>()));
  gh.factory<_i32.ListMangaBloc>(
      () => _i32.ListMangaBloc(get<_i27.FetchListMangaUseCase>()));
  gh.factoryParam<_i33.MangaDetailBloc, String, dynamic>((endpoint, _) =>
      _i33.MangaDetailBloc(endpoint, get<_i28.FetchMangaDetailUseCase>()));
  gh.factory<_i34.ChangeBackgroundBloc>(() => _i34.ChangeBackgroundBloc(
      get<_i29.GetBackgroundReadingUseCase>(),
      get<_i23.SetBackgroundReadingUseCase>()));
  gh.factory<_i35.ChangeReadingModeBloc>(() => _i35.ChangeReadingModeBloc(
      get<_i30.GetReadingModeUseCase>(), get<_i25.SetReadingModeUseCase>()));
  gh.factory<_i36.ChangeThemeBloc>(() => _i36.ChangeThemeBloc(
      get<_i31.GetThemeAppUseCase>(), get<_i26.SetThemeAppUseCase>()));
  gh.factory<_i37.ChapterScreenCubit>(() => _i37.ChapterScreenCubit(
      get<_i18.FetchDataChapterUsecase>(),
      repository: get<_i7.IChapterRepository>(),
      mangaDetailBloc: get<_i33.MangaDetailBloc>()));
  return get;
}

class _$StorageModule extends _i38.StorageModule {}
