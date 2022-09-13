// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i37;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i19;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i34;

import '../../features/chapter/application/change_background_color_bloc/change_background_bloc.dart'
    as _i53;
import '../../features/chapter/application/change_reading_mode_bloc/change_reading_mode_bloc.dart'
    as _i66;
import '../../features/chapter/application/chapter_screen/chapter_screen_cubit.dart'
    as _i6;
import '../../features/chapter/application/manage_page_in_chapter/manage_page_in_chapter_cubit.dart'
    as _i33;
import '../../features/chapter/chapter.dart' as _i4;
import '../../features/chapter/data/datasource/local/chapter_local_datasource.dart'
    as _i15;
import '../../features/chapter/data/datasource/remote/chapter_api_source.dart'
    as _i54;
import '../../features/chapter/data/repositories/chapter_repository_imp.dart'
    as _i16;
import '../../features/chapter/domain/domain.dart' as _i10;
import '../../features/chapter/domain/usecase/chapter_usecase/fetch_data_chapter_usecase.dart'
    as _i9;
import '../../features/download/application/download_manga/download_manga_cubit.dart'
    as _i8;
import '../../features/download/application/manage_download/manage_download_bloc.dart'
    as _i49;
import '../../features/download/data/datasource/local/download_local_source.dart'
    as _i18;
import '../../features/download/data/datasource/remote/download_api_source.dart'
    as _i17;
import '../../features/download/data/repositories/download_repository_imp.dart'
    as _i21;
import '../../features/download/domain/repository/repository.dart' as _i20;
import '../../features/download/domain/usecase/download_usecase/download_chap_usecase.dart'
    as _i39;
import '../../features/download/domain/usecase/download_usecase/find_chapter_usecase.dart'
    as _i41;
import '../../features/download/download.dart' as _i7;
import '../../features/github/application/update_app/update_app_cubit.dart'
    as _i35;
import '../../features/github/data/datasource/local/github_local_datasource.dart'
    as _i25;
import '../../features/github/data/datasource/remote/github_api_source.dart'
    as _i43;
import '../../features/github/data/repositories/github_repository_imp.dart'
    as _i27;
import '../../features/github/domain/repository/i_github_repository.dart'
    as _i14;
import '../../features/github/domain/usecase/github_usecase/get_latest_release_usecase.dart'
    as _i13;
import '../../features/github/domain/usecase/setting_usecase/get_download_path_usecase.dart'
    as _i42;
import '../../features/github/github.dart' as _i26;
import '../../features/manga/application/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i40;
import '../../features/manga/application/library_screen_bloc/library_screen_bloc.dart'
    as _i62;
import '../../features/manga/application/list_manga_bloc/list_manga_bloc.dart'
    as _i63;
import '../../features/manga/application/manage_favorite_manga/manage_favorite_manga_bloc.dart'
    as _i32;
import '../../features/manga/application/manga_detail_bloc/manga_detail_bloc.dart'
    as _i64;
import '../../features/manga/application/search_screen/search_screen_bloc.dart'
    as _i65;
import '../../features/manga/data/datasource/local/favorite_local_source.dart'
    as _i22;
import '../../features/manga/data/datasource/local/manga_local_source.dart'
    as _i28;
import '../../features/manga/data/datasource/remote/manga_api_source.dart'
    as _i44;
import '../../features/manga/data/dtos/dtos.dart' as _i29;
import '../../features/manga/data/repositories/favorite_repository.dart'
    as _i24;
import '../../features/manga/data/repositories/manga_repository_imp.dart'
    as _i46;
import '../../features/manga/domain/repositories/i_favorite_repository.dart'
    as _i23;
import '../../features/manga/domain/repositories/i_manga_repository.dart'
    as _i45;
import '../../features/manga/domain/usecase/favorite_manga/change_status_favorite_usercase.dart'
    as _i38;
import '../../features/manga/domain/usecase/favorite_manga/find_list_manga_library_usecase.dart'
    as _i57;
import '../../features/manga/domain/usecase/favorite_manga/get_all_manga_usecase.dart'
    as _i59;
import '../../features/manga/domain/usecase/favorite_manga/is_favorite_usecase.dart'
    as _i31;
import '../../features/manga/domain/usecase/favorite_manga/watch_id_favorite_tab_usecase.dart'
    as _i36;
import '../../features/manga/domain/usecase/list_manga/fetch_list_manga_usecase.dart'
    as _i55;
import '../../features/manga/domain/usecase/list_manga/find_manga_by_query_usecase.dart'
    as _i58;
import '../../features/manga/domain/usecase/manga_detail/fetch_manga_detail_usecase.dart'
    as _i56;
import '../../features/manga/manga.dart' as _i5;
import '../../features/shared/application/change_theme_bloc/change_theme_bloc.dart'
    as _i67;
import '../../features/shared/data/datasource/local/setting_local_datasource.dart'
    as _i30;
import '../../features/shared/data/repositories/setting_app_repository.dart'
    as _i48;
import '../../features/shared/domain/repositories/i_setting_app_repository.dart'
    as _i47;
import '../../features/shared/domain/repositories/repository.dart' as _i12;
import '../../features/shared/domain/usecase/setting_app/get_background_reading_usecase.dart'
    as _i11;
import '../../features/shared/domain/usecase/setting_app/get_reading_mode_usecase.dart'
    as _i60;
import '../../features/shared/domain/usecase/setting_app/get_setting_app_usecase.dart'
    as _i61;
import '../../features/shared/domain/usecase/setting_app/update_background_reading_usecase.dart'
    as _i50;
import '../../features/shared/domain/usecase/setting_app/update_reading_mode_usecase.dart'
    as _i51;
import '../../features/shared/domain/usecase/setting_app/update_setting_app_usecase.dart'
    as _i52;
import 'modules/network_module.dart' as _i69;
import 'modules/storage_module.dart'
    as _i68; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $registerDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final storageModule = _$StorageModule();
  final networkModule = _$NetworkModule();
  await gh.lazySingletonAsync<_i3.Box<List<String>>>(
      () => storageModule.favoriteBox,
      instanceName: 'favorite_box',
      preResolve: true);
  await gh.lazySingletonAsync<_i3.Box<_i4.ChapterDto>>(
      () => storageModule.chapterBox,
      instanceName: 'download_chapter_box',
      preResolve: true);
  await gh.lazySingletonAsync<_i3.Box<_i5.MangaDetailDto>>(
      () => storageModule.listMangaBox,
      instanceName: 'irohasu_iz_bezt_girl',
      preResolve: true);
  await gh.lazySingletonAsync<_i3.Box<String>>(() => storageModule.settingBox,
      instanceName: 'setting_box', preResolve: true);
  gh.factory<_i6.ChapterScreenCubit>(() => _i6.ChapterScreenCubit(
      get<_i4.FetchDataChapterUsecase>(), get<_i7.FindChapterUsecase>()));
  gh.factoryParam<_i8.DownloadMangaCubit, String, dynamic>((idManga, _) =>
      _i8.DownloadMangaCubit(idManga, get<_i7.IDownloadRepository>()));
  gh.factory<_i9.FetchDataChapterUsecase>(
      () => _i9.FetchDataChapterUsecase(get<_i10.IChapterRepository>()));
  gh.lazySingleton<_i11.GetBackgroundReadingUseCase>(() =>
      _i11.GetBackgroundReadingUseCase(get<_i12.ISettingAppRepository>()));
  gh.lazySingleton<_i13.GetLatestReleaseUseCase>(
      () => _i13.GetLatestReleaseUseCase(get<_i14.IGithubRepository>()));
  gh.factory<_i15.IChapterLocalDatasource>(() => _i15.ChapterLocalDatasource(
      get<_i3.Box<_i4.ChapterDto>>(instanceName: 'download_chapter_box')));
  gh.lazySingleton<_i4.IChapterRepository>(() => _i16.ChapterRepositoryImp(
      get<_i4.ChapterApiSource>(), get<_i4.IChapterLocalDatasource>()));
  gh.factory<_i17.IDownloadApiSource>(() => _i17.DownloadApiSourceImpl());
  gh.factory<_i18.IDownloadLocalSource>(() => _i18.DownloadLocalSourceImpl(
      get<_i19.Box<_i4.ChapterDto>>(instanceName: 'download_chapter_box')));
  gh.lazySingleton<_i20.IDownloadRepository>(() => _i21.DownloadRepositoryImpl(
      get<_i17.IDownloadApiSource>(), get<_i18.IDownloadLocalSource>()));
  gh.factory<_i22.IFavoriteLocalSource>(() => _i22.FavoriteLocalSource(
      get<_i3.Box<List<String>>>(instanceName: 'favorite_box')));
  gh.factory<_i23.IFavoriteRepository>(
      () => _i24.FavoriteRepository(get<_i22.IFavoriteLocalSource>()));
  gh.factory<_i25.IGithubLocalDataSource>(() => _i25.GithubLocalDataSource(
      get<_i19.Box<String>>(instanceName: 'setting_box')));
  gh.factory<_i26.IGithubRepository>(() => _i27.GithubRepository(
      get<_i26.IGithubApiSource>(), get<_i26.IGithubLocalDataSource>()));
  gh.factory<_i28.IMangaLocalSource>(() => _i28.MangaLocalSource(
      get<_i3.Box<_i29.MangaDetailDto>>(instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i30.ISettingLocalDataSource>(() => _i30.SettingLocalDataSource(
      get<_i19.Box<String>>(instanceName: 'setting_box')));
  gh.lazySingleton<_i31.IsFavoriteUseCase>(
      () => _i31.IsFavoriteUseCase(get<_i23.IFavoriteRepository>()));
  gh.factory<_i32.ManageFavoriteMangaBloc>(
      () => _i32.ManageFavoriteMangaBloc(get<_i23.IFavoriteRepository>()));
  gh.factoryParam<_i33.ManagePagesCubit, int, int>((currentPage, totalPages) =>
      _i33.ManagePagesCubit(currentPage, totalPages));
  gh.lazySingleton<_i34.PrettyDioLogger>(() => networkModule.prettyLogger);
  gh.factory<String>(() => networkModule.baseHttpUrl, instanceName: 'BaseUrl');
  gh.factory<_i35.UpdateAppCubit>(() => _i35.UpdateAppCubit(
      get<_i26.GetLatestReleaseUseCase>(), get<_i26.GetDownloadPathUseCase>()));
  gh.lazySingleton<_i36.WatchIdFavoriteTabUseCase>(
      () => _i36.WatchIdFavoriteTabUseCase(get<_i23.IFavoriteRepository>()));
  gh.lazySingleton<_i37.BaseOptions>(
      () => networkModule.dioBaseOptions(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i38.ChangeStatusFavoriteUseCase>(
      () => _i38.ChangeStatusFavoriteUseCase(get<_i23.IFavoriteRepository>()));
  gh.lazySingleton<_i37.Dio>(() =>
      networkModule.dio(get<_i37.BaseOptions>(), get<_i34.PrettyDioLogger>()));
  gh.factory<_i39.DownloadChapUsecase>(() => _i39.DownloadChapUsecase(
      get<_i4.IChapterRepository>(), get<_i7.IDownloadRepository>()));
  gh.factoryParam<_i40.FavoriteMangaDetailBloc, String, dynamic>(
      (endpoint, _) => _i40.FavoriteMangaDetailBloc(
          get<_i38.ChangeStatusFavoriteUseCase>(),
          get<_i31.IsFavoriteUseCase>(),
          endpoint));
  gh.lazySingleton<_i41.FindChapterUsecase>(() => _i41.FindChapterUsecase(
      get<_i4.IChapterRepository>(), get<_i7.IDownloadRepository>()));
  gh.lazySingleton<_i42.GetDownloadPathUseCase>(
      () => _i42.GetDownloadPathUseCase(get<_i26.IGithubRepository>()));
  gh.factory<_i43.IGithubApiSource>(
      () => _i43.GithubApiSource(get<_i37.Dio>()));
  gh.factory<_i44.IMangaApiSource>(() => _i44.MangaApiSource(get<_i37.Dio>()));
  gh.lazySingleton<_i45.IMangaRepository>(() => _i46.MangaRepository(
      get<_i44.IMangaApiSource>(), get<_i28.IMangaLocalSource>()));
  gh.factory<_i47.ISettingAppRepository>(
      () => _i48.SettingAppRepository(get<_i30.ISettingLocalDataSource>()));
  gh.factory<_i49.ManageDownloadBloc>(() => _i49.ManageDownloadBloc(
      get<_i9.FetchDataChapterUsecase>(),
      get<_i39.DownloadChapUsecase>(),
      get<_i42.GetDownloadPathUseCase>()));
  gh.lazySingleton<_i50.SetBackgroundReadingUseCase>(() =>
      _i50.SetBackgroundReadingUseCase(get<_i47.ISettingAppRepository>()));
  gh.lazySingleton<_i51.SetReadingModeUseCase>(
      () => _i51.SetReadingModeUseCase(get<_i47.ISettingAppRepository>()));
  gh.lazySingleton<_i52.SetThemeAppUseCase>(
      () => _i52.SetThemeAppUseCase(get<_i47.ISettingAppRepository>()));
  gh.factory<_i53.ChangeBackgroundBloc>(() => _i53.ChangeBackgroundBloc(
      get<_i11.GetBackgroundReadingUseCase>(),
      get<_i50.SetBackgroundReadingUseCase>()));
  gh.factory<_i54.ChapterApiSource>(
      () => _i54.ChapterApiSource(get<_i37.Dio>()));
  gh.lazySingleton<_i55.FetchListMangaUseCase>(
      () => _i55.FetchListMangaUseCase(get<_i45.IMangaRepository>()));
  gh.lazySingleton<_i56.FetchMangaDetailUseCase>(
      () => _i56.FetchMangaDetailUseCase(get<_i45.IMangaRepository>()));
  gh.lazySingleton<_i57.FindListMangaLibraryUseCase>(
      () => _i57.FindListMangaLibraryUseCase(get<_i45.IMangaRepository>()));
  gh.lazySingleton<_i58.FindMangaByQueryUseCase>(
      () => _i58.FindMangaByQueryUseCase(get<_i45.IMangaRepository>()));
  gh.lazySingleton<_i59.GetAllMangaUseCase>(
      () => _i59.GetAllMangaUseCase(get<_i45.IMangaRepository>()));
  gh.lazySingleton<_i60.GetReadingModeUseCase>(
      () => _i60.GetReadingModeUseCase(get<_i47.ISettingAppRepository>()));
  gh.lazySingleton<_i61.GetThemeAppUseCase>(
      () => _i61.GetThemeAppUseCase(get<_i47.ISettingAppRepository>()));
  gh.factory<_i62.LibraryScreenBloc>(() => _i62.LibraryScreenBloc(
      get<_i57.FindListMangaLibraryUseCase>(),
      get<_i36.WatchIdFavoriteTabUseCase>()));
  gh.factory<_i63.ListMangaBloc>(
      () => _i63.ListMangaBloc(get<_i55.FetchListMangaUseCase>()));
  gh.factoryParam<_i64.MangaDetailBloc, String, dynamic>((endpoint, _) =>
      _i64.MangaDetailBloc(endpoint, get<_i56.FetchMangaDetailUseCase>()));
  gh.factory<_i65.SearchScreenBloc>(
      () => _i65.SearchScreenBloc(get<_i58.FindMangaByQueryUseCase>()));
  gh.factory<_i66.ChangeReadingModeBloc>(() => _i66.ChangeReadingModeBloc(
      get<_i60.GetReadingModeUseCase>(), get<_i51.SetReadingModeUseCase>()));
  gh.factory<_i67.ChangeThemeBloc>(() => _i67.ChangeThemeBloc(
      get<_i61.GetThemeAppUseCase>(), get<_i52.SetThemeAppUseCase>()));
  return get;
}

class _$StorageModule extends _i68.StorageModule {}

class _$NetworkModule extends _i69.NetworkModule {}
