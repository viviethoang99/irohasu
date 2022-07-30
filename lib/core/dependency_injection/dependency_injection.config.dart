// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i35;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i20;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i30;

import '../../features/chapter/application/change_background_color_bloc/change_background_bloc.dart'
    as _i36;
import '../../features/chapter/application/change_reading_mode_bloc/change_reading_mode_bloc.dart'
    as _i62;
import '../../features/chapter/application/chapter_screen/chapter_screen_cubit.dart'
    as _i6;
import '../../features/chapter/application/download_chap/download_chap_cubit.dart'
    as _i7;
import '../../features/chapter/application/manage_download/manage_download_bloc.dart'
    as _i27;
import '../../features/chapter/application/manage_page_in_chapter/manage_page_in_chapter_cubit.dart'
    as _i29;
import '../../features/chapter/chapter.dart' as _i4;
import '../../features/chapter/data/datasource/local/chapter_local_datasource.dart'
    as _i14;
import '../../features/chapter/data/datasource/remote/chapter_api_source.dart'
    as _i50;
import '../../features/chapter/data/repositories/chapter_repository_imp.dart'
    as _i15;
import '../../features/chapter/domain/domain.dart' as _i9;
import '../../features/chapter/domain/usecase/chapter_usecase/fetch_data_chapter_usecase.dart'
    as _i8;
import '../../features/chapter/domain/usecase/download_usecase/download_chap_usecase.dart'
    as _i38;
import '../../features/chapter/domain/usecase/download_usecase/find_chapter_usecase.dart'
    as _i40;
import '../../features/chapter/domain/usecase/download_usecase/watch_chapter_download_usecase.dart'
    as _i33;
import '../../features/github/application/update_app/update_app_cubit.dart'
    as _i32;
import '../../features/github/data/datasource/local/github_local_datasource.dart'
    as _i19;
import '../../features/github/data/datasource/remote/github_api_source.dart'
    as _i42;
import '../../features/github/data/repositories/github_repository_imp.dart'
    as _i22;
import '../../features/github/domain/repository/i_github_repository.dart'
    as _i13;
import '../../features/github/domain/usecase/github_usecase/get_latest_release_usecase.dart'
    as _i12;
import '../../features/github/domain/usecase/setting_usecase/get_download_path_usecase.dart'
    as _i41;
import '../../features/github/github.dart' as _i21;
import '../../features/manga/application/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i39;
import '../../features/manga/application/library_screen_bloc/library_screen_bloc.dart'
    as _i58;
import '../../features/manga/application/list_manga_bloc/list_manga_bloc.dart'
    as _i59;
import '../../features/manga/application/manage_favorite_manga/manage_favorite_manga_bloc.dart'
    as _i28;
import '../../features/manga/application/manga_detail_bloc/manga_detail_bloc.dart'
    as _i60;
import '../../features/manga/application/search_screen/search_screen_bloc.dart'
    as _i61;
import '../../features/manga/data/datasource/local/favorite_local_source.dart'
    as _i16;
import '../../features/manga/data/datasource/local/manga_local_source.dart'
    as _i23;
import '../../features/manga/data/datasource/remote/manga_api_source.dart'
    as _i43;
import '../../features/manga/data/dtos/dtos.dart' as _i24;
import '../../features/manga/data/repositories/favorite_repository.dart'
    as _i18;
import '../../features/manga/data/repositories/manga_repository_imp.dart'
    as _i45;
import '../../features/manga/domain/repositories/i_favorite_repository.dart'
    as _i17;
import '../../features/manga/domain/repositories/i_manga_repository.dart'
    as _i44;
import '../../features/manga/domain/usecase/favorite_manga/change_status_favorite_usercase.dart'
    as _i37;
import '../../features/manga/domain/usecase/favorite_manga/find_list_manga_library_usecase.dart'
    as _i53;
import '../../features/manga/domain/usecase/favorite_manga/get_all_manga_usecase.dart'
    as _i55;
import '../../features/manga/domain/usecase/favorite_manga/is_favorite_usecase.dart'
    as _i26;
import '../../features/manga/domain/usecase/favorite_manga/watch_id_favorite_tab_usecase.dart'
    as _i34;
import '../../features/manga/domain/usecase/list_manga/fetch_list_manga_usecase.dart'
    as _i51;
import '../../features/manga/domain/usecase/list_manga/find_manga_by_query_usecase.dart'
    as _i54;
import '../../features/manga/domain/usecase/manga_detail/fetch_manga_detail_usecase.dart'
    as _i52;
import '../../features/manga/manga.dart' as _i5;
import '../../features/shared/application/change_theme_bloc/change_theme_bloc.dart'
    as _i63;
import '../../features/shared/data/datasource/local/setting_local_datasource.dart'
    as _i25;
import '../../features/shared/data/repositories/setting_app_repository.dart'
    as _i47;
import '../../features/shared/domain/repositories/i_setting_app_repository.dart'
    as _i46;
import '../../features/shared/domain/repositories/repository.dart' as _i11;
import '../../features/shared/domain/usecase/setting_app/get_background_reading_usecase.dart'
    as _i10;
import '../../features/shared/domain/usecase/setting_app/get_reading_mode_usecase.dart'
    as _i56;
import '../../features/shared/domain/usecase/setting_app/get_setting_app_usecase.dart'
    as _i57;
import '../../features/shared/domain/usecase/setting_app/update_background_reading_usecase.dart'
    as _i31;
import '../../features/shared/domain/usecase/setting_app/update_reading_mode_usecase.dart'
    as _i48;
import '../../features/shared/domain/usecase/setting_app/update_setting_app_usecase.dart'
    as _i49;
import 'modules/network_module.dart' as _i65;
import 'modules/storage_module.dart'
    as _i64; // ignore_for_file: unnecessary_lambdas

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
  await gh.lazySingletonAsync<_i3.Box<_i4.DownloadChapterDto>>(
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
      _i7.DownloadChapCubit(get<_i4.FindChapterUsecase>(),
          get<_i4.WatchDownloadChapterUsecase>(), idChapter));
  gh.lazySingleton<_i8.FetchDataChapterUsecase>(
      () => _i8.FetchDataChapterUsecase(get<_i9.IChapterRepository>()));
  gh.lazySingleton<_i10.GetBackgroundReadingUseCase>(() =>
      _i10.GetBackgroundReadingUseCase(get<_i11.ISettingAppRepository>()));
  gh.lazySingleton<_i12.GetLatestReleaseUseCase>(
      () => _i12.GetLatestReleaseUseCase(get<_i13.IGithubRepository>()));
  gh.factory<_i14.IChapterLocalDatasource>(() => _i14.ChapterLocalDatasource(
      get<_i3.Box<_i4.DownloadChapterDto>>(
          instanceName: 'download_chapter_box')));
  gh.lazySingleton<_i4.IChapterRepository>(() => _i15.ChapterRepositoryImp(
      get<_i4.ChapterApiSource>(), get<_i4.IChapterLocalDatasource>()));
  gh.factory<_i16.IFavoriteLocalSource>(() => _i16.FavoriteLocalSource(
      get<_i3.Box<List<String>>>(instanceName: 'favorite_box')));
  gh.factory<_i17.IFavoriteRepository>(
      () => _i18.FavoriteRepository(get<_i16.IFavoriteLocalSource>()));
  gh.factory<_i19.IGithubLocalDataSource>(() => _i19.GithubLocalDataSource(
      get<_i20.Box<String>>(instanceName: 'setting_box')));
  gh.factory<_i21.IGithubRepository>(() => _i22.GithubRepository(
      get<_i21.IGithubApiSource>(), get<_i21.IGithubLocalDataSource>()));
  gh.factory<_i23.IMangaLocalSource>(() => _i23.MangaLocalSource(
      get<_i3.Box<_i24.MangaDetailDto>>(instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i25.ISettingLocalDataSource>(() => _i25.SettingLocalDataSource(
      get<_i20.Box<String>>(instanceName: 'setting_box')));
  gh.lazySingleton<_i26.IsFavoriteUseCase>(
      () => _i26.IsFavoriteUseCase(get<_i17.IFavoriteRepository>()));
  gh.factory<_i27.ManageDownloadBloc>(() => _i27.ManageDownloadBloc(
      get<_i4.FetchDataChapterUsecase>(),
      get<_i4.DownloadChapUsecase>(),
      get<_i21.GetDownloadPathUseCase>()));
  gh.factory<_i28.ManageFavoriteMangaBloc>(
      () => _i28.ManageFavoriteMangaBloc(get<_i17.IFavoriteRepository>()));
  gh.factoryParam<_i29.ManagePagesCubit, int, int>((currentPage, totalPages) =>
      _i29.ManagePagesCubit(currentPage, totalPages));
  gh.lazySingleton<_i30.PrettyDioLogger>(() => networkModule.prettyLogger);
  gh.lazySingleton<_i31.SetBackgroundReadingUseCase>(() =>
      _i31.SetBackgroundReadingUseCase(get<_i11.ISettingAppRepository>()));
  gh.factory<String>(() => networkModule.baseHttpUrl, instanceName: 'BaseUrl');
  gh.factory<_i32.UpdateAppCubit>(() => _i32.UpdateAppCubit(
      get<_i21.GetLatestReleaseUseCase>(), get<_i21.GetDownloadPathUseCase>()));
  gh.factory<_i33.WatchDownloadChapterUsecase>(
      () => _i33.WatchDownloadChapterUsecase(get<_i4.IChapterRepository>()));
  gh.lazySingleton<_i34.WatchIdFavoriteTabUseCase>(
      () => _i34.WatchIdFavoriteTabUseCase(get<_i17.IFavoriteRepository>()));
  gh.lazySingleton<_i35.BaseOptions>(
      () => networkModule.dioBaseOptions(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i36.ChangeBackgroundBloc>(() => _i36.ChangeBackgroundBloc(
      get<_i10.GetBackgroundReadingUseCase>(),
      get<_i31.SetBackgroundReadingUseCase>()));
  gh.lazySingleton<_i37.ChangeStatusFavoriteUseCase>(
      () => _i37.ChangeStatusFavoriteUseCase(get<_i17.IFavoriteRepository>()));
  gh.lazySingleton<_i35.Dio>(() =>
      networkModule.dio(get<_i35.BaseOptions>(), get<_i30.PrettyDioLogger>()));
  gh.lazySingleton<_i38.DownloadChapUsecase>(
      () => _i38.DownloadChapUsecase(get<_i4.IChapterRepository>()));
  gh.factoryParam<_i39.FavoriteMangaDetailBloc, String, dynamic>(
      (endpoint, _) => _i39.FavoriteMangaDetailBloc(
          get<_i37.ChangeStatusFavoriteUseCase>(),
          get<_i26.IsFavoriteUseCase>(),
          endpoint));
  gh.factory<_i40.FindChapterUsecase>(
      () => _i40.FindChapterUsecase(get<_i4.IChapterRepository>()));
  gh.lazySingleton<_i41.GetDownloadPathUseCase>(
      () => _i41.GetDownloadPathUseCase(get<_i21.IGithubRepository>()));
  gh.factory<_i42.IGithubApiSource>(
      () => _i42.GithubApiSource(get<_i35.Dio>()));
  gh.factory<_i43.IMangaApiSource>(() => _i43.MangaApiSource(get<_i35.Dio>()));
  gh.lazySingleton<_i44.IMangaRepository>(() => _i45.MangaRepository(
      get<_i43.IMangaApiSource>(), get<_i23.IMangaLocalSource>()));
  gh.factory<_i46.ISettingAppRepository>(
      () => _i47.SettingAppRepository(get<_i25.ISettingLocalDataSource>()));
  gh.lazySingleton<_i48.SetReadingModeUseCase>(
      () => _i48.SetReadingModeUseCase(get<_i46.ISettingAppRepository>()));
  gh.lazySingleton<_i49.SetThemeAppUseCase>(
      () => _i49.SetThemeAppUseCase(get<_i46.ISettingAppRepository>()));
  gh.factory<_i50.ChapterApiSource>(
      () => _i50.ChapterApiSource(get<_i35.Dio>()));
  gh.lazySingleton<_i51.FetchListMangaUseCase>(
      () => _i51.FetchListMangaUseCase(get<_i44.IMangaRepository>()));
  gh.lazySingleton<_i52.FetchMangaDetailUseCase>(
      () => _i52.FetchMangaDetailUseCase(get<_i44.IMangaRepository>()));
  gh.lazySingleton<_i53.FindListMangaLibraryUseCase>(
      () => _i53.FindListMangaLibraryUseCase(get<_i44.IMangaRepository>()));
  gh.lazySingleton<_i54.FindMangaByQueryUseCase>(
      () => _i54.FindMangaByQueryUseCase(get<_i44.IMangaRepository>()));
  gh.lazySingleton<_i55.GetAllMangaUseCase>(
      () => _i55.GetAllMangaUseCase(get<_i44.IMangaRepository>()));
  gh.lazySingleton<_i56.GetReadingModeUseCase>(
      () => _i56.GetReadingModeUseCase(get<_i46.ISettingAppRepository>()));
  gh.lazySingleton<_i57.GetThemeAppUseCase>(
      () => _i57.GetThemeAppUseCase(get<_i46.ISettingAppRepository>()));
  gh.factory<_i58.LibraryScreenBloc>(() => _i58.LibraryScreenBloc(
      get<_i53.FindListMangaLibraryUseCase>(),
      get<_i34.WatchIdFavoriteTabUseCase>()));
  gh.factory<_i59.ListMangaBloc>(
      () => _i59.ListMangaBloc(get<_i51.FetchListMangaUseCase>()));
  gh.factoryParam<_i60.MangaDetailBloc, String, dynamic>((endpoint, _) =>
      _i60.MangaDetailBloc(endpoint, get<_i52.FetchMangaDetailUseCase>()));
  gh.factory<_i61.SearchScreenBloc>(
      () => _i61.SearchScreenBloc(get<_i54.FindMangaByQueryUseCase>()));
  gh.factory<_i62.ChangeReadingModeBloc>(() => _i62.ChangeReadingModeBloc(
      get<_i56.GetReadingModeUseCase>(), get<_i48.SetReadingModeUseCase>()));
  gh.factory<_i63.ChangeThemeBloc>(() => _i63.ChangeThemeBloc(
      get<_i57.GetThemeAppUseCase>(), get<_i49.SetThemeAppUseCase>()));
  return get;
}

class _$StorageModule extends _i64.StorageModule {}

class _$NetworkModule extends _i65.NetworkModule {}
