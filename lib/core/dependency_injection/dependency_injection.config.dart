// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i10;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i12;

import '../../src/data/datasource/local/favorite_local_source.dart' as _i5;
import '../../src/data/datasource/local/manga_local_source.dart' as _i8;
import '../../src/data/datasource/local/setting_local_datasource.dart' as _i9;
import '../../src/data/datasource/remote/chapter_api_source.dart' as _i26;
import '../../src/data/datasource/remote/manga_api_source.dart' as _i16;
import '../../src/data/dtos/dtos.dart' as _i4;
import '../../src/data/repositories/chapter_repository_imp.dart' as _i34;
import '../../src/data/repositories/favorite_repository.dart' as _i7;
import '../../src/data/repositories/manga_repository_imp.dart' as _i18;
import '../../src/data/repositories/setting_app_repository.dart' as _i20;
import '../../src/domain/repositories/i_chaper_repository.dart' as _i33;
import '../../src/domain/repositories/i_favorite_repository.dart' as _i6;
import '../../src/domain/repositories/i_manga_repository.dart' as _i17;
import '../../src/domain/repositories/i_setting_app_repository.dart' as _i19;
import '../../src/domain/usecaes/chapter/fetch_data_chapter_usecase.dart'
    as _i41;
import '../../src/domain/usecaes/favorite_manga/change_status_favorite_usercase.dart'
    as _i14;
import '../../src/domain/usecaes/favorite_manga/is_favorite_usecase.dart'
    as _i11;
import '../../src/domain/usecaes/list_manga/fetch_list_manga_usecase.dart'
    as _i27;
import '../../src/domain/usecaes/list_manga/find_manga_by_query_usecase.dart'
    as _i29;
import '../../src/domain/usecaes/manga_detail/fetch_manga_detail_usecase.dart'
    as _i28;
import '../../src/domain/usecaes/setting_app/get_background_reading_usecase.dart'
    as _i30;
import '../../src/domain/usecaes/setting_app/get_reading_mode_usecase.dart'
    as _i31;
import '../../src/domain/usecaes/setting_app/get_setting_app_usecase.dart'
    as _i32;
import '../../src/domain/usecaes/setting_app/set_default_setting_app_usecase.dart'
    as _i23;
import '../../src/domain/usecaes/setting_app/update_background_reading_usecase.dart'
    as _i22;
import '../../src/domain/usecaes/setting_app/update_reading_mode_usecase.dart'
    as _i24;
import '../../src/domain/usecaes/setting_app/update_setting_app_usecase.dart'
    as _i25;
import '../../src/presentation/blocs/change_background_color_bloc/change_background_bloc.dart'
    as _i38;
import '../../src/presentation/blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart'
    as _i39;
import '../../src/presentation/blocs/change_theme_bloc/change_theme_bloc.dart'
    as _i40;
import '../../src/presentation/blocs/chapter_screen/chapter_screen_cubit.dart'
    as _i42;
import '../../src/presentation/blocs/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i15;
import '../../src/presentation/blocs/library_screen_bloc/library_screen_bloc.dart'
    as _i21;
import '../../src/presentation/blocs/list_manga_bloc/list_manga_bloc.dart'
    as _i35;
import '../../src/presentation/blocs/manga_detail_bloc/manga_detail_bloc.dart'
    as _i36;
import '../../src/presentation/blocs/search_screen/search_screen_bloc.dart'
    as _i37;
import 'modules/network_module.dart' as _i44;
import 'modules/storage_module.dart'
    as _i43; // ignore_for_file: unnecessary_lambdas

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
  await gh.lazySingletonAsync<_i3.Box<_i4.MangaDetailDto>>(
      () => storageModule.listMangaBox,
      instanceName: 'irohasu_iz_bezt_girl',
      preResolve: true);
  gh.factory<_i5.IFavoriteLocalSource>(() => _i5.FavoriteLocalSource(
      get<_i3.Box<List<String>>>(instanceName: 'favorite_box')));
  gh.factory<_i6.IFavoriteRepository>(
      () => _i7.FavoriteRepository(get<_i5.IFavoriteLocalSource>()));
  gh.factory<_i8.IMangaLocalSource>(() => _i8.MangaLocalSource(
      get<_i3.Box<_i4.MangaDetailDto>>(instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i9.ISettingLocalDataSource>(() => _i9.SettingLocalDataSource(
      get<_i10.Box<String>>(instanceName: 'setting_box')));
  gh.lazySingleton<_i11.IsFavoriteUseCase>(
      () => _i11.IsFavoriteUseCase(get<_i6.IFavoriteRepository>()));
  gh.lazySingleton<_i12.PrettyDioLogger>(() => networkModule.prettyLogger);
  gh.factory<String>(() => networkModule.baseHttpUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i13.BaseOptions>(
      () => networkModule.dioBaseOptions(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i14.ChangeStatusFavoriteUseCase>(
      () => _i14.ChangeStatusFavoriteUseCase(get<_i6.IFavoriteRepository>()));
  gh.lazySingleton<_i13.Dio>(() =>
      networkModule.dio(get<_i13.BaseOptions>(), get<_i12.PrettyDioLogger>()));
  gh.factoryParam<_i15.FavoriteMangaDetailBloc, String, dynamic>(
      (endpoint, _) => _i15.FavoriteMangaDetailBloc(
          get<_i14.ChangeStatusFavoriteUseCase>(),
          get<_i11.IsFavoriteUseCase>(),
          endpoint));
  gh.factory<_i16.IMangaApiSource>(() => _i16.MangaApiSource(get<_i13.Dio>()));
  gh.lazySingleton<_i17.IMangaRepository>(() => _i18.MangaRepository(
      get<_i16.IMangaApiSource>(), get<_i8.IMangaLocalSource>()));
  gh.factory<_i19.ISettingAppRepository>(
      () => _i20.SettingAppRepository(get<_i9.ISettingLocalDataSource>()));
  gh.factory<_i21.LibraryScreenBloc>(
      () => _i21.LibraryScreenBloc(get<_i17.IMangaRepository>()));
  gh.lazySingleton<_i22.SetBackgroundReadingUseCase>(() =>
      _i22.SetBackgroundReadingUseCase(get<_i19.ISettingAppRepository>()));
  gh.lazySingleton<_i23.SetDefaultSettingAppUseCase>(() =>
      _i23.SetDefaultSettingAppUseCase(get<_i19.ISettingAppRepository>()));
  gh.lazySingleton<_i24.SetReadingModeUseCase>(
      () => _i24.SetReadingModeUseCase(get<_i19.ISettingAppRepository>()));
  gh.lazySingleton<_i25.SetThemeAppUseCase>(
      () => _i25.SetThemeAppUseCase(get<_i19.ISettingAppRepository>()));
  gh.factory<_i26.ChapterApiSource>(
      () => _i26.ChapterApiSource(get<_i13.Dio>()));
  gh.lazySingleton<_i27.FetchListMangaUseCase>(
      () => _i27.FetchListMangaUseCase(get<_i17.IMangaRepository>()));
  gh.lazySingleton<_i28.FetchMangaDetailUseCase>(
      () => _i28.FetchMangaDetailUseCase(get<_i17.IMangaRepository>()));
  gh.lazySingleton<_i29.FindMangaByQueryUseCase>(
      () => _i29.FindMangaByQueryUseCase(get<_i17.IMangaRepository>()));
  gh.lazySingleton<_i30.GetBackgroundReadingUseCase>(() =>
      _i30.GetBackgroundReadingUseCase(get<_i19.ISettingAppRepository>()));
  gh.lazySingleton<_i31.GetReadingModeUseCase>(
      () => _i31.GetReadingModeUseCase(get<_i19.ISettingAppRepository>()));
  gh.lazySingleton<_i32.GetThemeAppUseCase>(
      () => _i32.GetThemeAppUseCase(get<_i19.ISettingAppRepository>()));
  gh.lazySingleton<_i33.IChapterRepository>(
      () => _i34.ChapterRepositoryImp(get<_i26.ChapterApiSource>()));
  gh.factory<_i35.ListMangaBloc>(
      () => _i35.ListMangaBloc(get<_i27.FetchListMangaUseCase>()));
  gh.factoryParam<_i36.MangaDetailBloc, String, dynamic>((endpoint, _) =>
      _i36.MangaDetailBloc(endpoint, get<_i28.FetchMangaDetailUseCase>()));
  gh.factory<_i37.SearchScreenBloc>(
      () => _i37.SearchScreenBloc(get<_i29.FindMangaByQueryUseCase>()));
  gh.factory<_i38.ChangeBackgroundBloc>(() => _i38.ChangeBackgroundBloc(
      get<_i30.GetBackgroundReadingUseCase>(),
      get<_i22.SetBackgroundReadingUseCase>()));
  gh.factory<_i39.ChangeReadingModeBloc>(() => _i39.ChangeReadingModeBloc(
      get<_i31.GetReadingModeUseCase>(), get<_i24.SetReadingModeUseCase>()));
  gh.factory<_i40.ChangeThemeBloc>(() => _i40.ChangeThemeBloc(
      get<_i32.GetThemeAppUseCase>(), get<_i25.SetThemeAppUseCase>()));
  gh.lazySingleton<_i41.FetchDataChapterUsecase>(
      () => _i41.FetchDataChapterUsecase(get<_i33.IChapterRepository>()));
  gh.factory<_i42.ChapterScreenCubit>(() => _i42.ChapterScreenCubit(
      get<_i41.FetchDataChapterUsecase>(),
      repository: get<_i33.IChapterRepository>(),
      mangaDetailBloc: get<_i36.MangaDetailBloc>()));
  return get;
}

class _$StorageModule extends _i43.StorageModule {}

class _$NetworkModule extends _i44.NetworkModule {}
