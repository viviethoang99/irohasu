// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i33;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i22;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i27;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i30;

import '../../features/chapter/application/change_background_color_bloc/change_background_bloc.dart'
    as _i54;
import '../../features/chapter/application/change_reading_mode_bloc/change_reading_mode_bloc.dart'
    as _i68;
import '../../features/chapter/application/chapter_screen/chapter_screen_cubit.dart'
    as _i4;
import '../../features/chapter/application/manage_page_in_chapter/manage_page_in_chapter_cubit.dart'
    as _i29;
import '../../features/chapter/chapter.dart' as _i5;
import '../../features/chapter/data/datasource/local/chapter_local_datasource.dart'
    as _i39;
import '../../features/chapter/data/datasource/remote/chapter_api_source.dart'
    as _i55;
import '../../features/chapter/data/repositories/chapter_repository_imp.dart'
    as _i16;
import '../../features/chapter/domain/domain.dart' as _i11;
import '../../features/chapter/domain/usecase/chapter_usecase/fetch_data_chapter_usecase.dart'
    as _i10;
import '../../features/download/application/download_manga/download_manga_cubit.dart'
    as _i9;
import '../../features/download/application/manage_download/manage_download_bloc.dart'
    as _i50;
import '../../features/download/data/datasource/local/download_local_source.dart'
    as _i40;
import '../../features/download/data/datasource/remote/download_api_source.dart'
    as _i17;
import '../../features/download/data/repositories/download_repository_imp.dart'
    as _i42;
import '../../features/download/domain/repository/repository.dart' as _i41;
import '../../features/download/domain/usecase/download_usecase/delete_chapter_usecase.dart'
    as _i7;
import '../../features/download/domain/usecase/download_usecase/delete_manga_usecase.dart'
    as _i8;
import '../../features/download/domain/usecase/download_usecase/download_chap_usecase.dart'
    as _i35;
import '../../features/download/domain/usecase/download_usecase/find_chapter_usecase.dart'
    as _i37;
import '../../features/download/download.dart' as _i6;
import '../../features/github/application/update_app/update_app_cubit.dart'
    as _i31;
import '../../features/github/data/datasource/local/github_local_datasource.dart'
    as _i21;
import '../../features/github/data/datasource/remote/github_api_source.dart'
    as _i43;
import '../../features/github/data/repositories/github_repository_imp.dart'
    as _i24;
import '../../features/github/domain/repository/i_github_repository.dart'
    as _i15;
import '../../features/github/domain/usecase/github_usecase/get_latest_release_usecase.dart'
    as _i14;
import '../../features/github/domain/usecase/setting_usecase/get_download_path_usecase.dart'
    as _i38;
import '../../features/github/github.dart' as _i23;
import '../../features/manga/application/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i36;
import '../../features/manga/application/library_screen_bloc/library_screen_bloc.dart'
    as _i63;
import '../../features/manga/application/list_manga_bloc/list_manga_bloc.dart'
    as _i64;
import '../../features/manga/application/manage_favorite_manga/manage_favorite_manga_bloc.dart'
    as _i28;
import '../../features/manga/application/manga_detail_bloc/manga_detail_bloc.dart'
    as _i65;
import '../../features/manga/application/search_screen/search_screen_bloc.dart'
    as _i67;
import '../../features/manga/data/datasource/local/favorite_local_source.dart'
    as _i18;
import '../../features/manga/data/datasource/local/manga_local_source.dart'
    as _i45;
import '../../features/manga/data/datasource/remote/manga_api_source.dart'
    as _i44;
import '../../features/manga/data/repositories/favorite_repository.dart'
    as _i20;
import '../../features/manga/data/repositories/manga_repository_imp.dart'
    as _i47;
import '../../features/manga/domain/repositories/i_favorite_repository.dart'
    as _i19;
import '../../features/manga/domain/repositories/i_manga_repository.dart'
    as _i46;
import '../../features/manga/domain/usecase/favorite_manga/change_status_favorite_usercase.dart'
    as _i34;
import '../../features/manga/domain/usecase/favorite_manga/find_list_manga_library_usecase.dart'
    as _i58;
import '../../features/manga/domain/usecase/favorite_manga/get_all_manga_usecase.dart'
    as _i60;
import '../../features/manga/domain/usecase/favorite_manga/is_favorite_usecase.dart'
    as _i26;
import '../../features/manga/domain/usecase/favorite_manga/watch_id_favorite_tab_usecase.dart'
    as _i32;
import '../../features/manga/domain/usecase/list_manga/fetch_list_manga_usecase.dart'
    as _i56;
import '../../features/manga/domain/usecase/list_manga/find_manga_by_query_usecase.dart'
    as _i59;
import '../../features/manga/domain/usecase/manga_detail/fetch_manga_detail_usecase.dart'
    as _i57;
import '../../features/manga/presentation/detail/model/manga_detail_screen_params.dart'
    as _i66;
import '../../features/shared/application/change_theme_bloc/change_theme_bloc.dart'
    as _i69;
import '../../features/shared/data/datasource/local/setting_local_datasource.dart'
    as _i25;
import '../../features/shared/data/repositories/setting_app_repository.dart'
    as _i49;
import '../../features/shared/domain/repositories/i_setting_app_repository.dart'
    as _i48;
import '../../features/shared/domain/repositories/repository.dart' as _i13;
import '../../features/shared/domain/usecase/setting_app/get_background_reading_usecase.dart'
    as _i12;
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
import 'modules/network_module.dart' as _i71;
import 'modules/storage_module.dart'
    as _i70; // ignore_for_file: unnecessary_lambdas

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
  await gh.lazySingletonAsync<_i3.Box<String>>(
    () => storageModule.settingBox,
    instanceName: 'setting_box',
    preResolve: true,
  );
  gh.factory<_i4.ChapterScreenCubit>(() => _i4.ChapterScreenCubit(
        get<_i5.FetchDataChapterUsecase>(),
        get<_i6.FindChapterUsecase>(),
      ));
  gh.lazySingleton<_i7.DeleteChapUsecase>(
      () => _i7.DeleteChapUsecase(get<_i6.IDownloadRepository>()));
  gh.lazySingleton<_i8.DeleteMangaUsecase>(
      () => _i8.DeleteMangaUsecase(get<_i6.IDownloadRepository>()));
  gh.factoryParam<_i9.DownloadMangaCubit, String, dynamic>((
    idManga,
    _,
  ) =>
      _i9.DownloadMangaCubit(
        idManga,
        get<_i6.IDownloadRepository>(),
      ));
  gh.factory<_i10.FetchDataChapterUsecase>(
      () => _i10.FetchDataChapterUsecase(get<_i11.IChapterRepository>()));
  gh.lazySingleton<_i12.GetBackgroundReadingUseCase>(() =>
      _i12.GetBackgroundReadingUseCase(get<_i13.ISettingAppRepository>()));
  gh.lazySingleton<_i14.GetLatestReleaseUseCase>(
      () => _i14.GetLatestReleaseUseCase(get<_i15.IGithubRepository>()));
  gh.lazySingleton<_i5.IChapterRepository>(() => _i16.ChapterRepositoryImp(
        get<_i5.ChapterApiSource>(),
        get<_i5.IChapterLocalDatasource>(),
      ));
  gh.factory<_i17.IDownloadApiSource>(() => _i17.DownloadApiSourceImpl());
  gh.factory<_i18.IFavoriteLocalSource>(() => _i18.FavoriteLocalSource(
      get<_i3.Box<List<String>>>(instanceName: 'favorite_box')));
  gh.factory<_i19.IFavoriteRepository>(
      () => _i20.FavoriteRepository(get<_i18.IFavoriteLocalSource>()));
  gh.factory<_i21.IGithubLocalDataSource>(() => _i21.GithubLocalDataSource(
      get<_i22.Box<String>>(instanceName: 'setting_box')));
  gh.factory<_i23.IGithubRepository>(() => _i24.GithubRepository(
        get<_i23.IGithubApiSource>(),
        get<_i23.IGithubLocalDataSource>(),
      ));
  gh.factory<_i25.ISettingLocalDataSource>(() => _i25.SettingLocalDataSource(
      get<_i22.Box<String>>(instanceName: 'setting_box')));
  gh.lazySingleton<_i26.IsFavoriteUseCase>(
      () => _i26.IsFavoriteUseCase(get<_i19.IFavoriteRepository>()));
  await gh.lazySingletonAsync<_i27.Isar>(
    () => storageModule.chapterBox,
    instanceName: 'irohasu_is_bezt_girl',
    preResolve: true,
  );
  gh.factory<_i28.ManageFavoriteMangaBloc>(
      () => _i28.ManageFavoriteMangaBloc(get<_i19.IFavoriteRepository>()));
  gh.factoryParam<_i29.ManagePagesCubit, int, int>((
    currentPage,
    totalPages,
  ) =>
      _i29.ManagePagesCubit(
        currentPage,
        totalPages,
      ));
  gh.lazySingleton<_i30.PrettyDioLogger>(() => networkModule.prettyLogger);
  gh.factory<String>(
    () => networkModule.baseHttpUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i31.UpdateAppCubit>(() => _i31.UpdateAppCubit(
        get<_i23.GetLatestReleaseUseCase>(),
        get<_i23.GetDownloadPathUseCase>(),
      ));
  gh.lazySingleton<_i32.WatchIdFavoriteTabUseCase>(
      () => _i32.WatchIdFavoriteTabUseCase(get<_i19.IFavoriteRepository>()));
  gh.lazySingleton<_i33.BaseOptions>(
      () => networkModule.dioBaseOptions(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i34.ChangeStatusFavoriteUseCase>(
      () => _i34.ChangeStatusFavoriteUseCase(get<_i19.IFavoriteRepository>()));
  gh.lazySingleton<_i33.Dio>(() => networkModule.dio(
        get<_i33.BaseOptions>(),
        get<_i30.PrettyDioLogger>(),
      ));
  gh.factory<_i35.DownloadChapUsecase>(() => _i35.DownloadChapUsecase(
        get<_i5.IChapterRepository>(),
        get<_i6.IDownloadRepository>(),
      ));
  gh.factoryParam<_i36.FavoriteMangaDetailBloc, String, dynamic>((
    endpoint,
    _,
  ) =>
      _i36.FavoriteMangaDetailBloc(
        get<_i34.ChangeStatusFavoriteUseCase>(),
        get<_i26.IsFavoriteUseCase>(),
        endpoint,
      ));
  gh.lazySingleton<_i37.FindChapterUsecase>(() => _i37.FindChapterUsecase(
        get<_i5.IChapterRepository>(),
        get<_i6.IDownloadRepository>(),
      ));
  gh.lazySingleton<_i38.GetDownloadPathUseCase>(
      () => _i38.GetDownloadPathUseCase(get<_i23.IGithubRepository>()));
  gh.factory<_i39.IChapterLocalDatasource>(() => _i39.ChapterLocalDatasource(
      get<_i27.Isar>(instanceName: 'irohasu_is_bezt_girl')));
  gh.factory<_i40.IDownloadLocalSource>(() => _i40.DownloadLocalSourceImpl(
      get<_i27.Isar>(instanceName: 'irohasu_is_bezt_girl')));
  gh.lazySingleton<_i41.IDownloadRepository>(() => _i42.DownloadRepositoryImpl(
        get<_i17.IDownloadApiSource>(),
        get<_i40.IDownloadLocalSource>(),
      ));
  gh.factory<_i43.IGithubApiSource>(
      () => _i43.GithubApiSource(get<_i33.Dio>()));
  gh.factory<_i44.IMangaApiSource>(() => _i44.MangaApiSource(get<_i33.Dio>()));
  gh.factory<_i45.IMangaLocalSource>(() => _i45.MangaLocalSource(
      get<_i27.Isar>(instanceName: 'irohasu_is_bezt_girl')));
  gh.lazySingleton<_i46.IMangaRepository>(() => _i47.MangaRepository(
        get<_i44.IMangaApiSource>(),
        get<_i45.IMangaLocalSource>(),
      ));
  gh.factory<_i48.ISettingAppRepository>(
      () => _i49.SettingAppRepository(get<_i25.ISettingLocalDataSource>()));
  gh.lazySingleton<_i50.ManageDownloadBloc>(() => _i50.ManageDownloadBloc(
        get<_i10.FetchDataChapterUsecase>(),
        get<_i35.DownloadChapUsecase>(),
        get<_i38.GetDownloadPathUseCase>(),
        get<_i7.DeleteChapUsecase>(),
        get<_i8.DeleteMangaUsecase>(),
      ));
  gh.lazySingleton<_i51.SetBackgroundReadingUseCase>(() =>
      _i51.SetBackgroundReadingUseCase(get<_i48.ISettingAppRepository>()));
  gh.lazySingleton<_i52.SetReadingModeUseCase>(
      () => _i52.SetReadingModeUseCase(get<_i48.ISettingAppRepository>()));
  gh.lazySingleton<_i53.SetThemeAppUseCase>(
      () => _i53.SetThemeAppUseCase(get<_i48.ISettingAppRepository>()));
  gh.factory<_i54.ChangeBackgroundBloc>(() => _i54.ChangeBackgroundBloc(
        get<_i12.GetBackgroundReadingUseCase>(),
        get<_i51.SetBackgroundReadingUseCase>(),
      ));
  gh.factory<_i55.ChapterApiSource>(
      () => _i55.ChapterApiSource(get<_i33.Dio>()));
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
        get<_i32.WatchIdFavoriteTabUseCase>(),
      ));
  gh.factory<_i64.ListMangaBloc>(
      () => _i64.ListMangaBloc(get<_i56.FetchListMangaUseCase>()));
  gh.factoryParam<_i65.MangaDetailBloc, _i66.MangaDetailScreenParams, dynamic>((
    params,
    _,
  ) =>
      _i65.MangaDetailBloc(
        params,
        get<_i57.FetchMangaDetailUseCase>(),
      ));
  gh.factory<_i67.SearchScreenBloc>(
      () => _i67.SearchScreenBloc(get<_i59.FindMangaByQueryUseCase>()));
  gh.factory<_i68.ChangeReadingModeBloc>(() => _i68.ChangeReadingModeBloc(
        get<_i61.GetReadingModeUseCase>(),
        get<_i52.SetReadingModeUseCase>(),
      ));
  gh.factory<_i69.ChangeThemeBloc>(() => _i69.ChangeThemeBloc(
        get<_i62.GetThemeAppUseCase>(),
        get<_i53.SetThemeAppUseCase>(),
      ));
  return get;
}

class _$StorageModule extends _i70.StorageModule {}

class _$NetworkModule extends _i71.NetworkModule {}
