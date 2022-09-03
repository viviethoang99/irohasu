// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i38;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i25;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i34;

import '../../features/chapter/application/change_background_color_bloc/change_background_bloc.dart'
    as _i54;
import '../../features/chapter/application/change_reading_mode_bloc/change_reading_mode_bloc.dart'
    as _i67;
import '../../features/chapter/application/chapter_screen/chapter_screen_cubit.dart'
    as _i6;
import '../../features/chapter/application/manage_page_in_chapter/manage_page_in_chapter_cubit.dart'
    as _i33;
import '../../features/chapter/chapter.dart' as _i4;
import '../../features/chapter/data/datasource/local/chapter_local_datasource.dart'
    as _i15;
import '../../features/chapter/data/datasource/remote/chapter_api_source.dart'
    as _i55;
import '../../features/chapter/data/repositories/chapter_repository_imp.dart'
    as _i16;
import '../../features/chapter/domain/domain.dart' as _i10;
import '../../features/chapter/domain/usecase/chapter_usecase/fetch_data_chapter_usecase.dart'
    as _i9;
import '../../features/download/application/download_chap/download_chap_cubit.dart'
    as _i7;
import '../../features/download/application/manage_download/manage_download_bloc.dart'
    as _i50;
import '../../features/download/data/datasource/local/download_local_source.dart'
    as _i18;
import '../../features/download/data/datasource/remote/download_api_source.dart'
    as _i17;
import '../../features/download/data/repositories/download_repository_imp.dart'
    as _i20;
import '../../features/download/domain/repository/repository.dart' as _i19;
import '../../features/download/domain/usecase/download_usecase/download_chap_usecase.dart'
    as _i40;
import '../../features/download/domain/usecase/download_usecase/find_chapter_usecase.dart'
    as _i42;
import '../../features/download/domain/usecase/download_usecase/watch_chapter_download_usecase.dart'
    as _i36;
import '../../features/download/download.dart' as _i8;
import '../../features/github/application/update_app/update_app_cubit.dart'
    as _i35;
import '../../features/github/data/datasource/local/github_local_datasource.dart'
    as _i24;
import '../../features/github/data/datasource/remote/github_api_source.dart'
    as _i44;
import '../../features/github/data/repositories/github_repository_imp.dart'
    as _i27;
import '../../features/github/domain/repository/i_github_repository.dart'
    as _i14;
import '../../features/github/domain/usecase/github_usecase/get_latest_release_usecase.dart'
    as _i13;
import '../../features/github/domain/usecase/setting_usecase/get_download_path_usecase.dart'
    as _i43;
import '../../features/github/github.dart' as _i26;
import '../../features/manga/application/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i41;
import '../../features/manga/application/library_screen_bloc/library_screen_bloc.dart'
    as _i63;
import '../../features/manga/application/list_manga_bloc/list_manga_bloc.dart'
    as _i64;
import '../../features/manga/application/manage_favorite_manga/manage_favorite_manga_bloc.dart'
    as _i32;
import '../../features/manga/application/manga_detail_bloc/manga_detail_bloc.dart'
    as _i65;
import '../../features/manga/application/search_screen/search_screen_bloc.dart'
    as _i66;
import '../../features/manga/data/datasource/local/favorite_local_source.dart'
    as _i21;
import '../../features/manga/data/datasource/local/manga_local_source.dart'
    as _i28;
import '../../features/manga/data/datasource/remote/manga_api_source.dart'
    as _i45;
import '../../features/manga/data/dtos/dtos.dart' as _i29;
import '../../features/manga/data/repositories/favorite_repository.dart'
    as _i23;
import '../../features/manga/data/repositories/manga_repository_imp.dart'
    as _i47;
import '../../features/manga/domain/repositories/i_favorite_repository.dart'
    as _i22;
import '../../features/manga/domain/repositories/i_manga_repository.dart'
    as _i46;
import '../../features/manga/domain/usecase/favorite_manga/change_status_favorite_usercase.dart'
    as _i39;
import '../../features/manga/domain/usecase/favorite_manga/find_list_manga_library_usecase.dart'
    as _i58;
import '../../features/manga/domain/usecase/favorite_manga/get_all_manga_usecase.dart'
    as _i60;
import '../../features/manga/domain/usecase/favorite_manga/is_favorite_usecase.dart'
    as _i31;
import '../../features/manga/domain/usecase/favorite_manga/watch_id_favorite_tab_usecase.dart'
    as _i37;
import '../../features/manga/domain/usecase/list_manga/fetch_list_manga_usecase.dart'
    as _i56;
import '../../features/manga/domain/usecase/list_manga/find_manga_by_query_usecase.dart'
    as _i59;
import '../../features/manga/domain/usecase/manga_detail/fetch_manga_detail_usecase.dart'
    as _i57;
import '../../features/manga/manga.dart' as _i5;
import '../../features/shared/application/change_theme_bloc/change_theme_bloc.dart'
    as _i68;
import '../../features/shared/data/datasource/local/setting_local_datasource.dart'
    as _i30;
import '../../features/shared/data/repositories/setting_app_repository.dart'
    as _i49;
import '../../features/shared/domain/repositories/i_setting_app_repository.dart'
    as _i48;
import '../../features/shared/domain/repositories/repository.dart' as _i12;
import '../../features/shared/domain/usecase/setting_app/get_background_reading_usecase.dart'
    as _i11;
import '../../features/shared/domain/usecase/setting_app/get_reading_mode_usecase.dart'
    as _i61;
import '../../features/shared/domain/usecase/setting_app/get_setting_app_usecase.dart'
    as _i62;
import '../../features/shared/domain/usecase/setting_app/update_background_reading_usecase.dart'
    as _i51;
import '../../features/shared/domain/usecase/setting_app/update_reading_mode_usecase.dart'
    as _i52;
import '../../features/shared/domain/usecase/setting_app/update_setting_app_usecase.dart'
    as _i53;
import 'modules/network_module.dart' as _i70;
import 'modules/storage_module.dart'
    as _i69; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i6.ChapterScreenCubit>(
      () => _i6.ChapterScreenCubit(get<_i4.FetchDataChapterUsecase>()));
  gh.factoryParam<_i7.DownloadChapCubit, String, dynamic>((idChapter, _) =>
      _i7.DownloadChapCubit(get<_i8.FindChapterUsecase>(),
          get<_i8.WatchDownloadChapterUsecase>(), idChapter));
  gh.lazySingleton<_i9.FetchDataChapterUsecase>(
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
  gh.factory<_i18.IDownloadLocalSource>(() => _i18.DownloadLocalSourceImpl());
  gh.lazySingleton<_i19.IDownloadRepository>(() => _i20.DownloadRepositoryImpl(
      get<_i17.IDownloadApiSource>(), get<_i18.IDownloadLocalSource>()));
  gh.factory<_i21.IFavoriteLocalSource>(() => _i21.FavoriteLocalSource(
      get<_i3.Box<List<String>>>(instanceName: 'favorite_box')));
  gh.factory<_i22.IFavoriteRepository>(
      () => _i23.FavoriteRepository(get<_i21.IFavoriteLocalSource>()));
  gh.factory<_i24.IGithubLocalDataSource>(() => _i24.GithubLocalDataSource(
      get<_i25.Box<String>>(instanceName: 'setting_box')));
  gh.factory<_i26.IGithubRepository>(() => _i27.GithubRepository(
      get<_i26.IGithubApiSource>(), get<_i26.IGithubLocalDataSource>()));
  gh.factory<_i28.IMangaLocalSource>(() => _i28.MangaLocalSource(
      get<_i3.Box<_i29.MangaDetailDto>>(instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i30.ISettingLocalDataSource>(() => _i30.SettingLocalDataSource(
      get<_i25.Box<String>>(instanceName: 'setting_box')));
  gh.lazySingleton<_i31.IsFavoriteUseCase>(
      () => _i31.IsFavoriteUseCase(get<_i22.IFavoriteRepository>()));
  gh.factory<_i32.ManageFavoriteMangaBloc>(
      () => _i32.ManageFavoriteMangaBloc(get<_i22.IFavoriteRepository>()));
  gh.factoryParam<_i33.ManagePagesCubit, int, int>((currentPage, totalPages) =>
      _i33.ManagePagesCubit(currentPage, totalPages));
  gh.lazySingleton<_i34.PrettyDioLogger>(() => networkModule.prettyLogger);
  gh.factory<String>(() => networkModule.baseHttpUrl, instanceName: 'BaseUrl');
  gh.factory<_i35.UpdateAppCubit>(() => _i35.UpdateAppCubit(
      get<_i26.GetLatestReleaseUseCase>(), get<_i26.GetDownloadPathUseCase>()));
  gh.factory<_i36.WatchDownloadChapterUsecase>(
      () => _i36.WatchDownloadChapterUsecase(get<_i4.IChapterRepository>()));
  gh.lazySingleton<_i37.WatchIdFavoriteTabUseCase>(
      () => _i37.WatchIdFavoriteTabUseCase(get<_i22.IFavoriteRepository>()));
  gh.lazySingleton<_i38.BaseOptions>(
      () => networkModule.dioBaseOptions(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i39.ChangeStatusFavoriteUseCase>(
      () => _i39.ChangeStatusFavoriteUseCase(get<_i22.IFavoriteRepository>()));
  gh.lazySingleton<_i38.Dio>(() =>
      networkModule.dio(get<_i38.BaseOptions>(), get<_i34.PrettyDioLogger>()));
  gh.factory<_i40.DownloadChapUsecase>(() => _i40.DownloadChapUsecase(
      get<_i4.IChapterRepository>(), get<_i8.IDownloadRepository>()));
  gh.factoryParam<_i41.FavoriteMangaDetailBloc, String, dynamic>(
      (endpoint, _) => _i41.FavoriteMangaDetailBloc(
          get<_i39.ChangeStatusFavoriteUseCase>(),
          get<_i31.IsFavoriteUseCase>(),
          endpoint));
  gh.lazySingleton<_i42.FindChapterUsecase>(
      () => _i42.FindChapterUsecase(get<_i4.IChapterRepository>()));
  gh.lazySingleton<_i43.GetDownloadPathUseCase>(
      () => _i43.GetDownloadPathUseCase(get<_i26.IGithubRepository>()));
  gh.factory<_i44.IGithubApiSource>(
      () => _i44.GithubApiSource(get<_i38.Dio>()));
  gh.factory<_i45.IMangaApiSource>(() => _i45.MangaApiSource(get<_i38.Dio>()));
  gh.lazySingleton<_i46.IMangaRepository>(() => _i47.MangaRepository(
      get<_i45.IMangaApiSource>(), get<_i28.IMangaLocalSource>()));
  gh.factory<_i48.ISettingAppRepository>(
      () => _i49.SettingAppRepository(get<_i30.ISettingLocalDataSource>()));
  gh.factory<_i50.ManageDownloadBloc>(() => _i50.ManageDownloadBloc(
      get<_i9.FetchDataChapterUsecase>(),
      get<_i40.DownloadChapUsecase>(),
      get<_i43.GetDownloadPathUseCase>()));
  gh.lazySingleton<_i51.SetBackgroundReadingUseCase>(() =>
      _i51.SetBackgroundReadingUseCase(get<_i48.ISettingAppRepository>()));
  gh.lazySingleton<_i52.SetReadingModeUseCase>(
      () => _i52.SetReadingModeUseCase(get<_i48.ISettingAppRepository>()));
  gh.lazySingleton<_i53.SetThemeAppUseCase>(
      () => _i53.SetThemeAppUseCase(get<_i48.ISettingAppRepository>()));
  gh.factory<_i54.ChangeBackgroundBloc>(() => _i54.ChangeBackgroundBloc(
      get<_i11.GetBackgroundReadingUseCase>(),
      get<_i51.SetBackgroundReadingUseCase>()));
  gh.factory<_i55.ChapterApiSource>(
      () => _i55.ChapterApiSource(get<_i38.Dio>()));
  gh.lazySingleton<_i56.FetchListMangaUseCase>(
      () => _i56.FetchListMangaUseCase(get<_i46.IMangaRepository>()));
  gh.lazySingleton<_i57.FetchMangaDetailUseCase>(
      () => _i57.FetchMangaDetailUseCase(get<_i46.IMangaRepository>()));
  gh.lazySingleton<_i58.FindListMangaLibraryUseCase>(
      () => _i58.FindListMangaLibraryUseCase(get<_i46.IMangaRepository>()));
  gh.lazySingleton<_i59.FindMangaByQueryUseCase>(
      () => _i59.FindMangaByQueryUseCase(get<_i46.IMangaRepository>()));
  gh.lazySingleton<_i60.GetAllMangaUseCase>(
      () => _i60.GetAllMangaUseCase(get<_i46.IMangaRepository>()));
  gh.lazySingleton<_i61.GetReadingModeUseCase>(
      () => _i61.GetReadingModeUseCase(get<_i48.ISettingAppRepository>()));
  gh.lazySingleton<_i62.GetThemeAppUseCase>(
      () => _i62.GetThemeAppUseCase(get<_i48.ISettingAppRepository>()));
  gh.factory<_i63.LibraryScreenBloc>(() => _i63.LibraryScreenBloc(
      get<_i58.FindListMangaLibraryUseCase>(),
      get<_i37.WatchIdFavoriteTabUseCase>()));
  gh.factory<_i64.ListMangaBloc>(
      () => _i64.ListMangaBloc(get<_i56.FetchListMangaUseCase>()));
  gh.factoryParam<_i65.MangaDetailBloc, String, dynamic>((endpoint, _) =>
      _i65.MangaDetailBloc(endpoint, get<_i57.FetchMangaDetailUseCase>()));
  gh.factory<_i66.SearchScreenBloc>(
      () => _i66.SearchScreenBloc(get<_i59.FindMangaByQueryUseCase>()));
  gh.factory<_i67.ChangeReadingModeBloc>(() => _i67.ChangeReadingModeBloc(
      get<_i61.GetReadingModeUseCase>(), get<_i52.SetReadingModeUseCase>()));
  gh.factory<_i68.ChangeThemeBloc>(() => _i68.ChangeThemeBloc(
      get<_i62.GetThemeAppUseCase>(), get<_i53.SetThemeAppUseCase>()));
  return get;
}

class _$StorageModule extends _i69.StorageModule {}

class _$NetworkModule extends _i70.NetworkModule {}
