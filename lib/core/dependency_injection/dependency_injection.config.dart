// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i11;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i13;

import '../../src/data/datasource/local/favorite_local_source.dart' as _i6;
import '../../src/data/datasource/local/history_local_source.dart' as _i5;
import '../../src/data/datasource/local/manga_local_source.dart' as _i9;
import '../../src/data/datasource/local/setting_local_datasource.dart' as _i10;
import '../../src/data/datasource/remote/chapter_api_source.dart' as _i27;
import '../../src/data/datasource/remote/manga_api_source.dart' as _i17;
import '../../src/data/model/manga_detail_model.dart' as _i4;
import '../../src/data/repositories/chapter_repository_imp.dart' as _i35;
import '../../src/data/repositories/favorite_repository.dart' as _i8;
import '../../src/data/repositories/manga_repository_imp.dart' as _i19;
import '../../src/data/repositories/setting_app_repository.dart' as _i21;
import '../../src/domain/repositories/i_chaper_repository.dart' as _i34;
import '../../src/domain/repositories/i_favorite_repository.dart' as _i7;
import '../../src/domain/repositories/i_manga_repository.dart' as _i18;
import '../../src/domain/repositories/i_setting_app_repository.dart' as _i20;
import '../../src/domain/usecaes/chapter/fetch_data_chapter_usecase.dart'
    as _i42;
import '../../src/domain/usecaes/favorite_manga/change_status_favorite_usercase.dart'
    as _i15;
import '../../src/domain/usecaes/favorite_manga/is_favorite_usecase.dart'
    as _i12;
import '../../src/domain/usecaes/list_manga/fetch_list_manga_usecase.dart'
    as _i28;
import '../../src/domain/usecaes/list_manga/find_manga_by_query_usecase.dart'
    as _i30;
import '../../src/domain/usecaes/manga_detail/fetch_manga_detail_usecase.dart'
    as _i29;
import '../../src/domain/usecaes/setting_app/get_background_reading_usecase.dart'
    as _i31;
import '../../src/domain/usecaes/setting_app/get_reading_mode_usecase.dart'
    as _i32;
import '../../src/domain/usecaes/setting_app/get_setting_app_usecase.dart'
    as _i33;
import '../../src/domain/usecaes/setting_app/set_default_setting_app_usecase.dart'
    as _i24;
import '../../src/domain/usecaes/setting_app/update_background_reading_usecase.dart'
    as _i23;
import '../../src/domain/usecaes/setting_app/update_reading_mode_usecase.dart'
    as _i25;
import '../../src/domain/usecaes/setting_app/update_setting_app_usecase.dart'
    as _i26;
import '../../src/presentation/blocs/change_background_color_bloc/change_background_bloc.dart'
    as _i39;
import '../../src/presentation/blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart'
    as _i40;
import '../../src/presentation/blocs/change_theme_bloc/change_theme_bloc.dart'
    as _i41;
import '../../src/presentation/blocs/chapter_screen/chapter_screen_cubit.dart'
    as _i43;
import '../../src/presentation/blocs/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i16;
import '../../src/presentation/blocs/library_screen_bloc/library_screen_bloc.dart'
    as _i22;
import '../../src/presentation/blocs/list_manga_bloc/list_manga_bloc.dart'
    as _i36;
import '../../src/presentation/blocs/manga_detail_bloc/manga_detail_bloc.dart'
    as _i37;
import '../../src/presentation/blocs/search_screen/search_screen_bloc.dart'
    as _i38;
import 'modules/network_module.dart' as _i45;
import 'modules/storage_module.dart'
    as _i44; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $registerDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final storageModule = _$StorageModule();
  final networkModule = _$NetworkModule();
  await gh.lazySingletonAsync<_i3.Box<String>>(() => storageModule.settingBox,
      instanceName: 'setting_box', preResolve: true);
  await gh.lazySingletonAsync<_i3.Box<List<String>>>(
      () => storageModule.favoriteBox,
      instanceName: 'favorite_box',
      preResolve: true);
  await gh.lazySingletonAsync<_i3.Box<_i4.MangaDetailModel>>(
      () => storageModule.listMangaBox,
      instanceName: 'irohasu_iz_bezt_girl',
      preResolve: true);
  gh.factory<_i5.HistoryLocalSourceImp>(() => _i5.HistoryLocalSourceImp(
      get<_i3.Box<_i4.MangaDetailModel>>(
          instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i6.IFavoriteLocalSource>(() => _i6.FavoriteLocalSource(
      get<_i3.Box<List<String>>>(instanceName: 'favorite_box')));
  gh.factory<_i7.IFavoriteRepository>(
      () => _i8.FavoriteRepository(get<_i6.IFavoriteLocalSource>()));
  gh.factory<_i9.IMangaLocalSource>(() => _i9.MangaLocalSource(
      get<_i3.Box<_i4.MangaDetailModel>>(
          instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i10.ISettingLocalDataSource>(() => _i10.SettingLocalDataSource(
      get<_i11.Box<String>>(instanceName: 'setting_box')));
  gh.lazySingleton<_i12.IsFavoriteUseCase>(
      () => _i12.IsFavoriteUseCase(get<_i7.IFavoriteRepository>()));
  gh.lazySingleton<_i13.PrettyDioLogger>(() => networkModule.prettyLogger);
  gh.factory<String>(() => networkModule.baseHttpUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i14.BaseOptions>(
      () => networkModule.dioBaseOptions(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i15.ChangeStatusFavoriteUseCase>(
      () => _i15.ChangeStatusFavoriteUseCase(get<_i7.IFavoriteRepository>()));
  gh.lazySingleton<_i14.Dio>(() =>
      networkModule.dio(get<_i14.BaseOptions>(), get<_i13.PrettyDioLogger>()));
  gh.factoryParam<_i16.FavoriteMangaDetailBloc, String, dynamic>(
      (endpoint, _) => _i16.FavoriteMangaDetailBloc(
          get<_i15.ChangeStatusFavoriteUseCase>(),
          get<_i12.IsFavoriteUseCase>(),
          endpoint));
  gh.factory<_i17.IMangaApiSource>(() => _i17.MangaApiSource(get<_i14.Dio>()));
  gh.lazySingleton<_i18.IMangaRepository>(() => _i19.MangaRepository(
      get<_i17.IMangaApiSource>(), get<_i9.IMangaLocalSource>()));
  gh.factory<_i20.ISettingAppRepository>(
      () => _i21.SettingAppRepository(get<_i10.ISettingLocalDataSource>()));
  gh.factory<_i22.LibraryScreenBloc>(
      () => _i22.LibraryScreenBloc(get<_i18.IMangaRepository>()));
  gh.lazySingleton<_i23.SetBackgroundReadingUseCase>(() =>
      _i23.SetBackgroundReadingUseCase(get<_i20.ISettingAppRepository>()));
  gh.lazySingleton<_i24.SetDefaultSettingAppUseCase>(() =>
      _i24.SetDefaultSettingAppUseCase(get<_i20.ISettingAppRepository>()));
  gh.lazySingleton<_i25.SetReadingModeUseCase>(
      () => _i25.SetReadingModeUseCase(get<_i20.ISettingAppRepository>()));
  gh.lazySingleton<_i26.SetThemeAppUseCase>(
      () => _i26.SetThemeAppUseCase(get<_i20.ISettingAppRepository>()));
  gh.factory<_i27.ChapterApiSource>(
      () => _i27.ChapterApiSource(get<_i14.Dio>()));
  gh.lazySingleton<_i28.FetchListMangaUseCase>(
      () => _i28.FetchListMangaUseCase(get<_i18.IMangaRepository>()));
  gh.lazySingleton<_i29.FetchMangaDetailUseCase>(
      () => _i29.FetchMangaDetailUseCase(get<_i18.IMangaRepository>()));
  gh.lazySingleton<_i30.FindMangaByQueryUseCase>(
      () => _i30.FindMangaByQueryUseCase(get<_i18.IMangaRepository>()));
  gh.lazySingleton<_i31.GetBackgroundReadingUseCase>(() =>
      _i31.GetBackgroundReadingUseCase(get<_i20.ISettingAppRepository>()));
  gh.lazySingleton<_i32.GetReadingModeUseCase>(
      () => _i32.GetReadingModeUseCase(get<_i20.ISettingAppRepository>()));
  gh.lazySingleton<_i33.GetThemeAppUseCase>(
      () => _i33.GetThemeAppUseCase(get<_i20.ISettingAppRepository>()));
  gh.lazySingleton<_i34.IChapterRepository>(
      () => _i35.ChapterRepositoryImp(get<_i27.ChapterApiSource>()));
  gh.factory<_i36.ListMangaBloc>(
      () => _i36.ListMangaBloc(get<_i28.FetchListMangaUseCase>()));
  gh.factoryParam<_i37.MangaDetailBloc, String, dynamic>((endpoint, _) =>
      _i37.MangaDetailBloc(endpoint, get<_i29.FetchMangaDetailUseCase>()));
  gh.factory<_i38.SearchScreenBloc>(
      () => _i38.SearchScreenBloc(get<_i30.FindMangaByQueryUseCase>()));
  gh.factory<_i39.ChangeBackgroundBloc>(() => _i39.ChangeBackgroundBloc(
      get<_i31.GetBackgroundReadingUseCase>(),
      get<_i23.SetBackgroundReadingUseCase>()));
  gh.factory<_i40.ChangeReadingModeBloc>(() => _i40.ChangeReadingModeBloc(
      get<_i32.GetReadingModeUseCase>(), get<_i25.SetReadingModeUseCase>()));
  gh.factory<_i41.ChangeThemeBloc>(() => _i41.ChangeThemeBloc(
      get<_i33.GetThemeAppUseCase>(), get<_i26.SetThemeAppUseCase>()));
  gh.lazySingleton<_i42.FetchDataChapterUsecase>(
      () => _i42.FetchDataChapterUsecase(get<_i34.IChapterRepository>()));
  gh.factory<_i43.ChapterScreenCubit>(() => _i43.ChapterScreenCubit(
      get<_i42.FetchDataChapterUsecase>(),
      repository: get<_i34.IChapterRepository>(),
      mangaDetailBloc: get<_i37.MangaDetailBloc>()));
  return get;
}

class _$StorageModule extends _i44.StorageModule {}

class _$NetworkModule extends _i45.NetworkModule {}
