// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i30;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i17;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i26;

import '../../features/chapter/application/change_background_color_bloc/change_background_bloc.dart'
    as _i31;
import '../../features/chapter/application/change_reading_mode_bloc/change_reading_mode_bloc.dart'
    as _i57;
import '../../features/chapter/application/chapter_screen/chapter_screen_cubit.dart'
    as _i5;
import '../../features/chapter/application/manage_page_in_chapter/manage_page_in_chapter_cubit.dart'
    as _i25;
import '../../features/chapter/chapter.dart' as _i6;
import '../../features/chapter/data/datasource/remote/chapter_api_source.dart'
    as _i43;
import '../../features/chapter/data/repositories/chapter_repository_imp.dart'
    as _i52;
import '../../features/chapter/domain/domain.dart' as _i8;
import '../../features/chapter/domain/repository/i_chaper_repository.dart'
    as _i51;
import '../../features/chapter/domain/usecase/chapter/fetch_data_chapter_usecase.dart'
    as _i7;
import '../../features/github/application/update_app/update_app_cubit.dart'
    as _i28;
import '../../features/github/data/datasource/local/github_local_datasource.dart'
    as _i16;
import '../../features/github/data/datasource/remote/github_api_source.dart'
    as _i35;
import '../../features/github/data/repositories/github_repository_imp.dart'
    as _i19;
import '../../features/github/domain/repository/i_github_repository.dart'
    as _i12;
import '../../features/github/domain/usecase/github_usecase/get_latest_release_usecase.dart'
    as _i11;
import '../../features/github/domain/usecase/setting_usecase/get_download_path_usecase.dart'
    as _i34;
import '../../features/github/github.dart' as _i18;
import '../../features/manga/application/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i33;
import '../../features/manga/application/library_screen_bloc/library_screen_bloc.dart'
    as _i53;
import '../../features/manga/application/list_manga_bloc/list_manga_bloc.dart'
    as _i54;
import '../../features/manga/application/manage_favorite_manga/manage_favorite_manga_bloc.dart'
    as _i24;
import '../../features/manga/application/manga_detail_bloc/manga_detail_bloc.dart'
    as _i55;
import '../../features/manga/application/search_screen/search_screen_bloc.dart'
    as _i56;
import '../../features/manga/data/datasource/local/favorite_local_source.dart'
    as _i13;
import '../../features/manga/data/datasource/local/manga_local_source.dart'
    as _i20;
import '../../features/manga/data/datasource/remote/manga_api_source.dart'
    as _i36;
import '../../features/manga/data/dtos/dtos.dart' as _i21;
import '../../features/manga/data/repositories/favorite_repository.dart'
    as _i15;
import '../../features/manga/data/repositories/manga_repository_imp.dart'
    as _i38;
import '../../features/manga/domain/repositories/i_favorite_repository.dart'
    as _i14;
import '../../features/manga/domain/repositories/i_manga_repository.dart'
    as _i37;
import '../../features/manga/domain/usecase/favorite_manga/change_status_favorite_usercase.dart'
    as _i32;
import '../../features/manga/domain/usecase/favorite_manga/find_list_manga_library_usecase.dart'
    as _i46;
import '../../features/manga/domain/usecase/favorite_manga/get_all_manga_usecase.dart'
    as _i48;
import '../../features/manga/domain/usecase/favorite_manga/is_favorite_usecase.dart'
    as _i23;
import '../../features/manga/domain/usecase/favorite_manga/watch_id_favorite_tab_usecase.dart'
    as _i29;
import '../../features/manga/domain/usecase/list_manga/fetch_list_manga_usecase.dart'
    as _i44;
import '../../features/manga/domain/usecase/list_manga/find_manga_by_query_usecase.dart'
    as _i47;
import '../../features/manga/domain/usecase/manga_detail/fetch_manga_detail_usecase.dart'
    as _i45;
import '../../features/manga/manga.dart' as _i4;
import '../../features/shared/application/change_theme_bloc/change_theme_bloc.dart'
    as _i58;
import '../../features/shared/data/datasource/local/setting_local_datasource.dart'
    as _i22;
import '../../features/shared/data/repositories/setting_app_repository.dart'
    as _i40;
import '../../features/shared/domain/repositories/i_setting_app_repository.dart'
    as _i39;
import '../../features/shared/domain/repositories/repository.dart' as _i10;
import '../../features/shared/domain/usecase/setting_app/get_background_reading_usecase.dart'
    as _i9;
import '../../features/shared/domain/usecase/setting_app/get_reading_mode_usecase.dart'
    as _i49;
import '../../features/shared/domain/usecase/setting_app/get_setting_app_usecase.dart'
    as _i50;
import '../../features/shared/domain/usecase/setting_app/update_background_reading_usecase.dart'
    as _i27;
import '../../features/shared/domain/usecase/setting_app/update_reading_mode_usecase.dart'
    as _i41;
import '../../features/shared/domain/usecase/setting_app/update_setting_app_usecase.dart'
    as _i42;
import 'modules/network_module.dart' as _i60;
import 'modules/storage_module.dart'
    as _i59; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i5.ChapterScreenCubit>(
      () => _i5.ChapterScreenCubit(get<_i6.FetchDataChapterUsecase>()));
  gh.lazySingleton<_i7.FetchDataChapterUsecase>(
      () => _i7.FetchDataChapterUsecase(get<_i8.IChapterRepository>()));
  gh.lazySingleton<_i9.GetBackgroundReadingUseCase>(
      () => _i9.GetBackgroundReadingUseCase(get<_i10.ISettingAppRepository>()));
  gh.lazySingleton<_i11.GetLatestReleaseUseCase>(
      () => _i11.GetLatestReleaseUseCase(get<_i12.IGithubRepository>()));
  gh.factory<_i13.IFavoriteLocalSource>(() => _i13.FavoriteLocalSource(
      get<_i3.Box<List<String>>>(instanceName: 'favorite_box')));
  gh.factory<_i14.IFavoriteRepository>(
      () => _i15.FavoriteRepository(get<_i13.IFavoriteLocalSource>()));
  gh.factory<_i16.IGithubLocalDataSource>(() => _i16.GithubLocalDataSource(
      get<_i17.Box<String>>(instanceName: 'setting_box')));
  gh.factory<_i18.IGithubRepository>(() => _i19.GithubRepository(
      get<_i18.IGithubApiSource>(), get<_i18.IGithubLocalDataSource>()));
  gh.factory<_i20.IMangaLocalSource>(() => _i20.MangaLocalSource(
      get<_i3.Box<_i21.MangaDetailDto>>(instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i22.ISettingLocalDataSource>(() => _i22.SettingLocalDataSource(
      get<_i17.Box<String>>(instanceName: 'setting_box')));
  gh.lazySingleton<_i23.IsFavoriteUseCase>(
      () => _i23.IsFavoriteUseCase(get<_i14.IFavoriteRepository>()));
  gh.factory<_i24.ManageFavoriteMangaBloc>(
      () => _i24.ManageFavoriteMangaBloc(get<_i14.IFavoriteRepository>()));
  gh.factoryParam<_i25.ManagePagesCubit, int, int>((currentPage, totalPages) =>
      _i25.ManagePagesCubit(currentPage, totalPages));
  gh.lazySingleton<_i26.PrettyDioLogger>(() => networkModule.prettyLogger);
  gh.lazySingleton<_i27.SetBackgroundReadingUseCase>(() =>
      _i27.SetBackgroundReadingUseCase(get<_i10.ISettingAppRepository>()));
  gh.factory<String>(() => networkModule.baseHttpUrl, instanceName: 'BaseUrl');
  gh.factory<_i28.UpdateAppCubit>(() => _i28.UpdateAppCubit(
      get<_i18.GetLatestReleaseUseCase>(), get<_i18.GetDownloadPathUseCase>()));
  gh.lazySingleton<_i29.WatchIdFavoriteTabUseCase>(
      () => _i29.WatchIdFavoriteTabUseCase(get<_i14.IFavoriteRepository>()));
  gh.lazySingleton<_i30.BaseOptions>(
      () => networkModule.dioBaseOptions(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i31.ChangeBackgroundBloc>(() => _i31.ChangeBackgroundBloc(
      get<_i9.GetBackgroundReadingUseCase>(),
      get<_i27.SetBackgroundReadingUseCase>()));
  gh.lazySingleton<_i32.ChangeStatusFavoriteUseCase>(
      () => _i32.ChangeStatusFavoriteUseCase(get<_i14.IFavoriteRepository>()));
  gh.lazySingleton<_i30.Dio>(() =>
      networkModule.dio(get<_i30.BaseOptions>(), get<_i26.PrettyDioLogger>()));
  gh.factoryParam<_i33.FavoriteMangaDetailBloc, String, dynamic>(
      (endpoint, _) => _i33.FavoriteMangaDetailBloc(
          get<_i32.ChangeStatusFavoriteUseCase>(),
          get<_i23.IsFavoriteUseCase>(),
          endpoint));
  gh.lazySingleton<_i34.GetDownloadPathUseCase>(
      () => _i34.GetDownloadPathUseCase(get<_i18.IGithubRepository>()));
  gh.factory<_i35.IGithubApiSource>(
      () => _i35.GithubApiSource(get<_i30.Dio>()));
  gh.factory<_i36.IMangaApiSource>(() => _i36.MangaApiSource(get<_i30.Dio>()));
  gh.lazySingleton<_i37.IMangaRepository>(() => _i38.MangaRepository(
      get<_i36.IMangaApiSource>(), get<_i20.IMangaLocalSource>()));
  gh.factory<_i39.ISettingAppRepository>(
      () => _i40.SettingAppRepository(get<_i22.ISettingLocalDataSource>()));
  gh.lazySingleton<_i41.SetReadingModeUseCase>(
      () => _i41.SetReadingModeUseCase(get<_i39.ISettingAppRepository>()));
  gh.lazySingleton<_i42.SetThemeAppUseCase>(
      () => _i42.SetThemeAppUseCase(get<_i39.ISettingAppRepository>()));
  gh.factory<_i43.ChapterApiSource>(
      () => _i43.ChapterApiSource(get<_i30.Dio>()));
  gh.lazySingleton<_i44.FetchListMangaUseCase>(
      () => _i44.FetchListMangaUseCase(get<_i37.IMangaRepository>()));
  gh.lazySingleton<_i45.FetchMangaDetailUseCase>(
      () => _i45.FetchMangaDetailUseCase(get<_i37.IMangaRepository>()));
  gh.lazySingleton<_i46.FindListMangaLibraryUseCase>(
      () => _i46.FindListMangaLibraryUseCase(get<_i37.IMangaRepository>()));
  gh.lazySingleton<_i47.FindMangaByQueryUseCase>(
      () => _i47.FindMangaByQueryUseCase(get<_i37.IMangaRepository>()));
  gh.lazySingleton<_i48.GetAllMangaUseCase>(
      () => _i48.GetAllMangaUseCase(get<_i37.IMangaRepository>()));
  gh.lazySingleton<_i49.GetReadingModeUseCase>(
      () => _i49.GetReadingModeUseCase(get<_i39.ISettingAppRepository>()));
  gh.lazySingleton<_i50.GetThemeAppUseCase>(
      () => _i50.GetThemeAppUseCase(get<_i39.ISettingAppRepository>()));
  gh.lazySingleton<_i51.IChapterRepository>(
      () => _i52.ChapterRepositoryImp(get<_i43.ChapterApiSource>()));
  gh.factory<_i53.LibraryScreenBloc>(() => _i53.LibraryScreenBloc(
      get<_i46.FindListMangaLibraryUseCase>(),
      get<_i29.WatchIdFavoriteTabUseCase>()));
  gh.factory<_i54.ListMangaBloc>(
      () => _i54.ListMangaBloc(get<_i44.FetchListMangaUseCase>()));
  gh.factoryParam<_i55.MangaDetailBloc, String, dynamic>((endpoint, _) =>
      _i55.MangaDetailBloc(endpoint, get<_i45.FetchMangaDetailUseCase>()));
  gh.factory<_i56.SearchScreenBloc>(
      () => _i56.SearchScreenBloc(get<_i47.FindMangaByQueryUseCase>()));
  gh.factory<_i57.ChangeReadingModeBloc>(() => _i57.ChangeReadingModeBloc(
      get<_i49.GetReadingModeUseCase>(), get<_i41.SetReadingModeUseCase>()));
  gh.factory<_i58.ChangeThemeBloc>(() => _i58.ChangeThemeBloc(
      get<_i50.GetThemeAppUseCase>(), get<_i42.SetThemeAppUseCase>()));
  return get;
}

class _$StorageModule extends _i59.StorageModule {}

class _$NetworkModule extends _i60.NetworkModule {}
