// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i39;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i21;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i36;

import '../../features/chapter/application/change_background_color_bloc/change_background_bloc.dart'
    as _i55;
import '../../features/chapter/application/change_reading_mode_bloc/change_reading_mode_bloc.dart'
    as _i69;
import '../../features/chapter/application/chapter_screen/chapter_screen_cubit.dart'
    as _i6;
import '../../features/chapter/application/manage_page_in_chapter/manage_page_in_chapter_cubit.dart'
    as _i35;
import '../../features/chapter/chapter.dart' as _i4;
import '../../features/chapter/data/datasource/local/chapter_local_datasource.dart'
    as _i17;
import '../../features/chapter/data/datasource/remote/chapter_api_source.dart'
    as _i56;
import '../../features/chapter/data/repositories/chapter_repository_imp.dart'
    as _i18;
import '../../features/chapter/domain/domain.dart' as _i12;
import '../../features/chapter/domain/usecase/chapter_usecase/fetch_data_chapter_usecase.dart'
    as _i11;
import '../../features/download/application/download_manga/download_manga_cubit.dart'
    as _i10;
import '../../features/download/application/manage_download/manage_download_bloc.dart'
    as _i51;
import '../../features/download/data/datasource/local/download_local_source.dart'
    as _i20;
import '../../features/download/data/datasource/remote/download_api_source.dart'
    as _i19;
import '../../features/download/data/repositories/download_repository_imp.dart'
    as _i23;
import '../../features/download/domain/repository/repository.dart' as _i22;
import '../../features/download/domain/usecase/download_usecase/delete_chapter_usecase.dart'
    as _i8;
import '../../features/download/domain/usecase/download_usecase/delete_manga_usecase.dart'
    as _i9;
import '../../features/download/domain/usecase/download_usecase/download_chap_usecase.dart'
    as _i41;
import '../../features/download/domain/usecase/download_usecase/find_chapter_usecase.dart'
    as _i43;
import '../../features/download/download.dart' as _i7;
import '../../features/github/application/update_app/update_app_cubit.dart'
    as _i37;
import '../../features/github/data/datasource/local/github_local_datasource.dart'
    as _i27;
import '../../features/github/data/datasource/remote/github_api_source.dart'
    as _i45;
import '../../features/github/data/repositories/github_repository_imp.dart'
    as _i29;
import '../../features/github/domain/repository/i_github_repository.dart'
    as _i16;
import '../../features/github/domain/usecase/github_usecase/get_latest_release_usecase.dart'
    as _i15;
import '../../features/github/domain/usecase/setting_usecase/get_download_path_usecase.dart'
    as _i44;
import '../../features/github/github.dart' as _i28;
import '../../features/manga/application/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i42;
import '../../features/manga/application/library_screen_bloc/library_screen_bloc.dart'
    as _i64;
import '../../features/manga/application/list_manga_bloc/list_manga_bloc.dart'
    as _i65;
import '../../features/manga/application/manage_favorite_manga/manage_favorite_manga_bloc.dart'
    as _i34;
import '../../features/manga/application/manga_detail_bloc/manga_detail_bloc.dart'
    as _i66;
import '../../features/manga/application/search_screen/search_screen_bloc.dart'
    as _i68;
import '../../features/manga/data/datasource/local/favorite_local_source.dart'
    as _i24;
import '../../features/manga/data/datasource/local/manga_local_source.dart'
    as _i30;
import '../../features/manga/data/datasource/remote/manga_api_source.dart'
    as _i46;
import '../../features/manga/data/dtos/dtos.dart' as _i31;
import '../../features/manga/data/repositories/favorite_repository.dart'
    as _i26;
import '../../features/manga/data/repositories/manga_repository_imp.dart'
    as _i48;
import '../../features/manga/domain/repositories/i_favorite_repository.dart'
    as _i25;
import '../../features/manga/domain/repositories/i_manga_repository.dart'
    as _i47;
import '../../features/manga/domain/usecase/favorite_manga/change_status_favorite_usercase.dart'
    as _i40;
import '../../features/manga/domain/usecase/favorite_manga/find_list_manga_library_usecase.dart'
    as _i59;
import '../../features/manga/domain/usecase/favorite_manga/get_all_manga_usecase.dart'
    as _i61;
import '../../features/manga/domain/usecase/favorite_manga/is_favorite_usecase.dart'
    as _i33;
import '../../features/manga/domain/usecase/favorite_manga/watch_id_favorite_tab_usecase.dart'
    as _i38;
import '../../features/manga/domain/usecase/list_manga/fetch_list_manga_usecase.dart'
    as _i57;
import '../../features/manga/domain/usecase/list_manga/find_manga_by_query_usecase.dart'
    as _i60;
import '../../features/manga/domain/usecase/manga_detail/fetch_manga_detail_usecase.dart'
    as _i58;
import '../../features/manga/manga.dart' as _i5;
import '../../features/manga/presentation/detail/model/manga_detail_screen_params.dart'
    as _i67;
import '../../features/shared/application/change_theme_bloc/change_theme_bloc.dart'
    as _i70;
import '../../features/shared/data/datasource/local/setting_local_datasource.dart'
    as _i32;
import '../../features/shared/data/repositories/setting_app_repository.dart'
    as _i50;
import '../../features/shared/domain/repositories/i_setting_app_repository.dart'
    as _i49;
import '../../features/shared/domain/repositories/repository.dart' as _i14;
import '../../features/shared/domain/usecase/setting_app/get_background_reading_usecase.dart'
    as _i13;
import '../../features/shared/domain/usecase/setting_app/get_reading_mode_usecase.dart'
    as _i62;
import '../../features/shared/domain/usecase/setting_app/get_setting_app_usecase.dart'
    as _i63;
import '../../features/shared/domain/usecase/setting_app/update_background_reading_usecase.dart'
    as _i52;
import '../../features/shared/domain/usecase/setting_app/update_reading_mode_usecase.dart'
    as _i53;
import '../../features/shared/domain/usecase/setting_app/update_setting_app_usecase.dart'
    as _i54;
import 'modules/network_module.dart' as _i72;
import 'modules/storage_module.dart'
    as _i71; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $registerDependencies(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final storageModule = _$StorageModule();
  final networkModule = _$NetworkModule();
  await gh.lazySingletonAsync<_i3.Box<List<String>>>(
    () => storageModule.favoriteBox,
    instanceName: 'favorite_box',
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i3.Box<_i4.ChapterDto>>(
    () => storageModule.chapterBox,
    instanceName: 'download_chapter_box',
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i3.Box<_i5.MangaDetailDto>>(
    () => storageModule.listMangaBox,
    instanceName: 'irohasu_iz_bezt_girl',
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i3.Box<String>>(
    () => storageModule.settingBox,
    instanceName: 'setting_box',
    preResolve: true,
  );
  gh.factory<_i6.ChapterScreenCubit>(() => _i6.ChapterScreenCubit(
        get<_i4.FetchDataChapterUsecase>(),
        get<_i7.FindChapterUsecase>(),
      ));
  gh.lazySingleton<_i8.DeleteChapUsecase>(
      () => _i8.DeleteChapUsecase(get<_i7.IDownloadRepository>()));
  gh.lazySingleton<_i9.DeleteMangaUsecase>(
      () => _i9.DeleteMangaUsecase(get<_i7.IDownloadRepository>()));
  gh.factoryParam<_i10.DownloadMangaCubit, String, dynamic>((
    idManga,
    _,
  ) =>
      _i10.DownloadMangaCubit(
        idManga,
        get<_i7.IDownloadRepository>(),
      ));
  gh.factory<_i11.FetchDataChapterUsecase>(
      () => _i11.FetchDataChapterUsecase(get<_i12.IChapterRepository>()));
  gh.lazySingleton<_i13.GetBackgroundReadingUseCase>(() =>
      _i13.GetBackgroundReadingUseCase(get<_i14.ISettingAppRepository>()));
  gh.lazySingleton<_i15.GetLatestReleaseUseCase>(
      () => _i15.GetLatestReleaseUseCase(get<_i16.IGithubRepository>()));
  gh.factory<_i17.IChapterLocalDatasource>(() => _i17.ChapterLocalDatasource(
      get<_i3.Box<_i4.ChapterDto>>(instanceName: 'download_chapter_box')));
  gh.lazySingleton<_i4.IChapterRepository>(() => _i18.ChapterRepositoryImp(
        get<_i4.ChapterApiSource>(),
        get<_i4.IChapterLocalDatasource>(),
      ));
  gh.factory<_i19.IDownloadApiSource>(() => _i19.DownloadApiSourceImpl());
  gh.factory<_i20.IDownloadLocalSource>(() => _i20.DownloadLocalSourceImpl(
      get<_i21.Box<_i4.ChapterDto>>(instanceName: 'download_chapter_box')));
  gh.lazySingleton<_i22.IDownloadRepository>(() => _i23.DownloadRepositoryImpl(
        get<_i19.IDownloadApiSource>(),
        get<_i20.IDownloadLocalSource>(),
      ));
  gh.factory<_i24.IFavoriteLocalSource>(() => _i24.FavoriteLocalSource(
      get<_i3.Box<List<String>>>(instanceName: 'favorite_box')));
  gh.factory<_i25.IFavoriteRepository>(
      () => _i26.FavoriteRepository(get<_i24.IFavoriteLocalSource>()));
  gh.factory<_i27.IGithubLocalDataSource>(() => _i27.GithubLocalDataSource(
      get<_i21.Box<String>>(instanceName: 'setting_box')));
  gh.factory<_i28.IGithubRepository>(() => _i29.GithubRepository(
        get<_i28.IGithubApiSource>(),
        get<_i28.IGithubLocalDataSource>(),
      ));
  gh.factory<_i30.IMangaLocalSource>(() => _i30.MangaLocalSource(
      get<_i3.Box<_i31.MangaDetailDto>>(instanceName: 'irohasu_iz_bezt_girl')));
  gh.factory<_i32.ISettingLocalDataSource>(() => _i32.SettingLocalDataSource(
      get<_i21.Box<String>>(instanceName: 'setting_box')));
  gh.lazySingleton<_i33.IsFavoriteUseCase>(
      () => _i33.IsFavoriteUseCase(get<_i25.IFavoriteRepository>()));
  gh.factory<_i34.ManageFavoriteMangaBloc>(
      () => _i34.ManageFavoriteMangaBloc(get<_i25.IFavoriteRepository>()));
  gh.factoryParam<_i35.ManagePagesCubit, int, int>((
    currentPage,
    totalPages,
  ) =>
      _i35.ManagePagesCubit(
        currentPage,
        totalPages,
      ));
  gh.lazySingleton<_i36.PrettyDioLogger>(() => networkModule.prettyLogger);
  gh.factory<String>(
    () => networkModule.baseHttpUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i37.UpdateAppCubit>(() => _i37.UpdateAppCubit(
        get<_i28.GetLatestReleaseUseCase>(),
        get<_i28.GetDownloadPathUseCase>(),
      ));
  gh.lazySingleton<_i38.WatchIdFavoriteTabUseCase>(
      () => _i38.WatchIdFavoriteTabUseCase(get<_i25.IFavoriteRepository>()));
  gh.lazySingleton<_i39.BaseOptions>(
      () => networkModule.dioBaseOptions(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i40.ChangeStatusFavoriteUseCase>(
      () => _i40.ChangeStatusFavoriteUseCase(get<_i25.IFavoriteRepository>()));
  gh.lazySingleton<_i39.Dio>(() => networkModule.dio(
        get<_i39.BaseOptions>(),
        get<_i36.PrettyDioLogger>(),
      ));
  gh.factory<_i41.DownloadChapUsecase>(() => _i41.DownloadChapUsecase(
        get<_i4.IChapterRepository>(),
        get<_i7.IDownloadRepository>(),
      ));
  gh.factoryParam<_i42.FavoriteMangaDetailBloc, String, dynamic>((
    endpoint,
    _,
  ) =>
      _i42.FavoriteMangaDetailBloc(
        get<_i40.ChangeStatusFavoriteUseCase>(),
        get<_i33.IsFavoriteUseCase>(),
        endpoint,
      ));
  gh.lazySingleton<_i43.FindChapterUsecase>(() => _i43.FindChapterUsecase(
        get<_i4.IChapterRepository>(),
        get<_i7.IDownloadRepository>(),
      ));
  gh.lazySingleton<_i44.GetDownloadPathUseCase>(
      () => _i44.GetDownloadPathUseCase(get<_i28.IGithubRepository>()));
  gh.factory<_i45.IGithubApiSource>(
      () => _i45.GithubApiSource(get<_i39.Dio>()));
  gh.factory<_i46.IMangaApiSource>(() => _i46.MangaApiSource(get<_i39.Dio>()));
  gh.lazySingleton<_i47.IMangaRepository>(() => _i48.MangaRepository(
        get<_i46.IMangaApiSource>(),
        get<_i30.IMangaLocalSource>(),
      ));
  gh.factory<_i49.ISettingAppRepository>(
      () => _i50.SettingAppRepository(get<_i32.ISettingLocalDataSource>()));
  gh.lazySingleton<_i51.ManageDownloadBloc>(() => _i51.ManageDownloadBloc(
        get<_i11.FetchDataChapterUsecase>(),
        get<_i41.DownloadChapUsecase>(),
        get<_i44.GetDownloadPathUseCase>(),
        get<_i8.DeleteChapUsecase>(),
        get<_i9.DeleteMangaUsecase>(),
      ));
  gh.lazySingleton<_i52.SetBackgroundReadingUseCase>(() =>
      _i52.SetBackgroundReadingUseCase(get<_i49.ISettingAppRepository>()));
  gh.lazySingleton<_i53.SetReadingModeUseCase>(
      () => _i53.SetReadingModeUseCase(get<_i49.ISettingAppRepository>()));
  gh.lazySingleton<_i54.SetThemeAppUseCase>(
      () => _i54.SetThemeAppUseCase(get<_i49.ISettingAppRepository>()));
  gh.factory<_i55.ChangeBackgroundBloc>(() => _i55.ChangeBackgroundBloc(
        get<_i13.GetBackgroundReadingUseCase>(),
        get<_i52.SetBackgroundReadingUseCase>(),
      ));
  gh.factory<_i56.ChapterApiSource>(
      () => _i56.ChapterApiSource(get<_i39.Dio>()));
  gh.lazySingleton<_i57.FetchListMangaUseCase>(
      () => _i57.FetchListMangaUseCase(get<_i47.IMangaRepository>()));
  gh.lazySingleton<_i58.FetchMangaDetailUseCase>(
      () => _i58.FetchMangaDetailUseCase(get<_i47.IMangaRepository>()));
  gh.lazySingleton<_i59.FindListMangaLibraryUseCase>(
      () => _i59.FindListMangaLibraryUseCase(get<_i47.IMangaRepository>()));
  gh.lazySingleton<_i60.FindMangaByQueryUseCase>(
      () => _i60.FindMangaByQueryUseCase(get<_i47.IMangaRepository>()));
  gh.lazySingleton<_i61.GetAllMangaUseCase>(
      () => _i61.GetAllMangaUseCase(get<_i47.IMangaRepository>()));
  gh.lazySingleton<_i62.GetReadingModeUseCase>(
      () => _i62.GetReadingModeUseCase(get<_i49.ISettingAppRepository>()));
  gh.lazySingleton<_i63.GetThemeAppUseCase>(
      () => _i63.GetThemeAppUseCase(get<_i49.ISettingAppRepository>()));
  gh.factory<_i64.LibraryScreenBloc>(() => _i64.LibraryScreenBloc(
        get<_i59.FindListMangaLibraryUseCase>(),
        get<_i38.WatchIdFavoriteTabUseCase>(),
      ));
  gh.factory<_i65.ListMangaBloc>(
      () => _i65.ListMangaBloc(get<_i57.FetchListMangaUseCase>()));
  gh.factoryParam<_i66.MangaDetailBloc, _i67.MangaDetailScreenParams, dynamic>((
    params,
    _,
  ) =>
      _i66.MangaDetailBloc(
        params,
        get<_i58.FetchMangaDetailUseCase>(),
      ));
  gh.factory<_i68.SearchScreenBloc>(
      () => _i68.SearchScreenBloc(get<_i60.FindMangaByQueryUseCase>()));
  gh.factory<_i69.ChangeReadingModeBloc>(() => _i69.ChangeReadingModeBloc(
        get<_i62.GetReadingModeUseCase>(),
        get<_i53.SetReadingModeUseCase>(),
      ));
  gh.factory<_i70.ChangeThemeBloc>(() => _i70.ChangeThemeBloc(
        get<_i63.GetThemeAppUseCase>(),
        get<_i54.SetThemeAppUseCase>(),
      ));
  return get;
}

class _$StorageModule extends _i71.StorageModule {}

class _$NetworkModule extends _i72.NetworkModule {}
