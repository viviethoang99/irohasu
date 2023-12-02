// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i10;
import 'package:hive_flutter/hive_flutter.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i17;

import '../../features/appearance/application/appearance_cubit.dart' as _i3;
import '../../features/chapter/application/change_background_color_bloc/change_background_bloc.dart'
    as _i53;
import '../../features/chapter/application/change_reading_mode_bloc/change_reading_mode_bloc.dart'
    as _i54;
import '../../features/chapter/application/chapter_screen/chapter_screen_cubit.dart'
    as _i58;
import '../../features/chapter/application/manage_page_in_chapter/manage_page_in_chapter_cubit.dart'
    as _i16;
import '../../features/chapter/chapter.dart' as _i59;
import '../../features/chapter/data/datasource/remote/chapter_api_source.dart'
    as _i34;
import '../../features/chapter/data/repositories/chapter_repository_imp.dart'
    as _i47;
import '../../features/chapter/domain/domain.dart' as _i57;
import '../../features/chapter/domain/repository/i_chaper_repository.dart'
    as _i46;
import '../../features/chapter/domain/usecase/chapter/fetch_data_chapter_usecase.dart'
    as _i56;
import '../../features/github/application/update_app/update_app_cubit.dart'
    as _i52;
import '../../features/github/data/datasource/local/github_local_datasource.dart'
    as _i9;
import '../../features/github/data/datasource/remote/github_api_source.dart'
    as _i22;
import '../../features/github/data/repositories/github_repository_imp.dart'
    as _i24;
import '../../features/github/domain/repository/i_github_repository.dart'
    as _i43;
import '../../features/github/domain/usecase/github_usecase/get_latest_release_usecase.dart'
    as _i42;
import '../../features/github/domain/usecase/setting_usecase/get_download_path_usecase.dart'
    as _i41;
import '../../features/github/github.dart' as _i23;
import '../../features/manga/application/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart'
    as _i21;
import '../../features/manga/application/library_screen_bloc/library_screen_bloc.dart'
    as _i48;
import '../../features/manga/application/list_manga_bloc/list_manga_bloc.dart'
    as _i49;
import '../../features/manga/application/manage_favorite_manga/manage_favorite_manga_bloc.dart'
    as _i15;
import '../../features/manga/application/manga_detail_bloc/manga_detail_bloc.dart'
    as _i50;
import '../../features/manga/application/search_screen/search_screen_bloc.dart'
    as _i51;
import '../../features/manga/data/datasource/local/favorite_local_source.dart'
    as _i6;
import '../../features/manga/data/datasource/local/manga_local_source.dart'
    as _i11;
import '../../features/manga/data/datasource/remote/manga_api_source.dart'
    as _i25;
import '../../features/manga/data/dtos/dtos.dart' as _i12;
import '../../features/manga/data/repositories/favorite_repository.dart' as _i8;
import '../../features/manga/data/repositories/manga_repository_imp.dart'
    as _i27;
import '../../features/manga/domain/repositories/i_favorite_repository.dart'
    as _i7;
import '../../features/manga/domain/repositories/i_manga_repository.dart'
    as _i26;
import '../../features/manga/domain/usecase/favorite_manga/change_status_favorite_usercase.dart'
    as _i20;
import '../../features/manga/domain/usecase/favorite_manga/find_list_manga_library_usecase.dart'
    as _i37;
import '../../features/manga/domain/usecase/favorite_manga/get_all_manga_usecase.dart'
    as _i39;
import '../../features/manga/domain/usecase/favorite_manga/is_favorite_usecase.dart'
    as _i14;
import '../../features/manga/domain/usecase/favorite_manga/watch_id_favorite_tab_usecase.dart'
    as _i18;
import '../../features/manga/domain/usecase/list_manga/fetch_list_manga_usecase.dart'
    as _i35;
import '../../features/manga/domain/usecase/list_manga/find_manga_by_query_usecase.dart'
    as _i38;
import '../../features/manga/domain/usecase/manga_detail/fetch_manga_detail_usecase.dart'
    as _i36;
import '../../features/manga/manga.dart' as _i5;
import '../../features/shared/application/change_theme_bloc/change_theme_bloc.dart'
    as _i55;
import '../../features/shared/data/datasource/local/setting_local_datasource.dart'
    as _i13;
import '../../features/shared/data/repositories/setting_app_repository.dart'
    as _i29;
import '../../features/shared/domain/repositories/i_setting_app_repository.dart'
    as _i28;
import '../../features/shared/domain/repositories/repository.dart' as _i31;
import '../../features/shared/domain/usecase/setting_app/get_background_reading_usecase.dart'
    as _i40;
import '../../features/shared/domain/usecase/setting_app/get_reading_mode_usecase.dart'
    as _i44;
import '../../features/shared/domain/usecase/setting_app/get_setting_app_usecase.dart'
    as _i45;
import '../../features/shared/domain/usecase/setting_app/update_background_reading_usecase.dart'
    as _i30;
import '../../features/shared/domain/usecase/setting_app/update_reading_mode_usecase.dart'
    as _i32;
import '../../features/shared/domain/usecase/setting_app/update_setting_app_usecase.dart'
    as _i33;
import 'modules/network_module.dart' as _i61;
import 'modules/storage_module.dart' as _i60;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    gh.singleton<_i3.AppearanceCubit>(_i3.AppearanceCubit());
    await gh.lazySingletonAsync<_i4.Box<_i5.MangaDetailDto>>(
      () => storageModule.listMangaBox,
      instanceName: 'irohasu_iz_bezt_girl',
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.Box<String>>(
      () => storageModule.settingBox,
      instanceName: 'setting_box',
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.Box<List<String>>>(
      () => storageModule.favoriteBox,
      instanceName: 'favorite_box',
      preResolve: true,
    );
    gh.factory<_i6.IFavoriteLocalSource>(() => _i6.FavoriteLocalSource(
        gh<_i4.Box<List<String>>>(instanceName: 'favorite_box')));
    gh.factory<_i7.IFavoriteRepository>(
        () => _i8.FavoriteRepository(gh<_i6.IFavoriteLocalSource>()));
    gh.factory<_i9.IGithubLocalDataSource>(() => _i9.GithubLocalDataSource(
        gh<_i10.Box<String>>(instanceName: 'setting_box')));
    gh.factory<_i11.IMangaLocalSource>(() => _i11.MangaLocalSource(
        gh<_i4.Box<_i12.MangaDetailDto>>(
            instanceName: 'irohasu_iz_bezt_girl')));
    gh.factory<_i13.ISettingLocalDataSource>(() => _i13.SettingLocalDataSource(
        gh<_i10.Box<String>>(instanceName: 'setting_box')));
    gh.lazySingleton<_i14.IsFavoriteUseCase>(
        () => _i14.IsFavoriteUseCase(gh<_i7.IFavoriteRepository>()));
    gh.factory<_i15.ManageFavoriteMangaBloc>(
        () => _i15.ManageFavoriteMangaBloc(gh<_i7.IFavoriteRepository>()));
    gh.factoryParam<_i16.ManagePagesCubit, int, int>((
      currentPage,
      totalPages,
    ) =>
        _i16.ManagePagesCubit(
          currentPage,
          totalPages,
        ));
    gh.lazySingleton<_i17.PrettyDioLogger>(() => networkModule.prettyLogger);
    gh.factory<String>(
      () => networkModule.baseHttpUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i18.WatchIdFavoriteTabUseCase>(
        () => _i18.WatchIdFavoriteTabUseCase(gh<_i7.IFavoriteRepository>()));
    gh.lazySingleton<_i19.BaseOptions>(() =>
        networkModule.dioBaseOptions(gh<String>(instanceName: 'BaseUrl')));
    gh.lazySingleton<_i20.ChangeStatusFavoriteUseCase>(
        () => _i20.ChangeStatusFavoriteUseCase(gh<_i7.IFavoriteRepository>()));
    gh.lazySingleton<_i19.Dio>(() => networkModule.dio(
          gh<_i19.BaseOptions>(),
          gh<_i17.PrettyDioLogger>(),
        ));
    gh.factoryParam<_i21.FavoriteMangaDetailBloc, String, dynamic>((
      endpoint,
      _,
    ) =>
        _i21.FavoriteMangaDetailBloc(
          gh<_i20.ChangeStatusFavoriteUseCase>(),
          gh<_i14.IsFavoriteUseCase>(),
          endpoint,
        ));
    gh.factory<_i22.IGithubApiSource>(
        () => _i22.GithubApiSource(gh<_i19.Dio>()));
    gh.factory<_i23.IGithubRepository>(() => _i24.GithubRepository(
          gh<_i23.IGithubApiSource>(),
          gh<_i23.IGithubLocalDataSource>(),
        ));
    gh.factory<_i25.IMangaApiSource>(() => _i25.MangaApiSource(gh<_i19.Dio>()));
    gh.lazySingleton<_i26.IMangaRepository>(() => _i27.MangaRepository(
          gh<_i25.IMangaApiSource>(),
          gh<_i11.IMangaLocalSource>(),
        ));
    gh.factory<_i28.ISettingAppRepository>(
        () => _i29.SettingAppRepository(gh<_i13.ISettingLocalDataSource>()));
    gh.lazySingleton<_i30.SetBackgroundReadingUseCase>(() =>
        _i30.SetBackgroundReadingUseCase(gh<_i31.ISettingAppRepository>()));
    gh.lazySingleton<_i32.SetReadingModeUseCase>(
        () => _i32.SetReadingModeUseCase(gh<_i28.ISettingAppRepository>()));
    gh.lazySingleton<_i33.SetThemeAppUseCase>(
        () => _i33.SetThemeAppUseCase(gh<_i28.ISettingAppRepository>()));
    gh.factory<_i34.ChapterApiSource>(
        () => _i34.ChapterApiSource(gh<_i19.Dio>()));
    gh.lazySingleton<_i35.FetchListMangaUseCase>(
        () => _i35.FetchListMangaUseCase(gh<_i26.IMangaRepository>()));
    gh.lazySingleton<_i36.FetchMangaDetailUseCase>(
        () => _i36.FetchMangaDetailUseCase(gh<_i26.IMangaRepository>()));
    gh.lazySingleton<_i37.FindListMangaLibraryUseCase>(
        () => _i37.FindListMangaLibraryUseCase(gh<_i26.IMangaRepository>()));
    gh.lazySingleton<_i38.FindMangaByQueryUseCase>(
        () => _i38.FindMangaByQueryUseCase(gh<_i26.IMangaRepository>()));
    gh.lazySingleton<_i39.GetAllMangaUseCase>(
        () => _i39.GetAllMangaUseCase(gh<_i26.IMangaRepository>()));
    gh.lazySingleton<_i40.GetBackgroundReadingUseCase>(() =>
        _i40.GetBackgroundReadingUseCase(gh<_i31.ISettingAppRepository>()));
    gh.lazySingleton<_i41.GetDownloadPathUseCase>(
        () => _i41.GetDownloadPathUseCase(gh<_i23.IGithubRepository>()));
    gh.lazySingleton<_i42.GetLatestReleaseUseCase>(
        () => _i42.GetLatestReleaseUseCase(gh<_i43.IGithubRepository>()));
    gh.lazySingleton<_i44.GetReadingModeUseCase>(
        () => _i44.GetReadingModeUseCase(gh<_i28.ISettingAppRepository>()));
    gh.lazySingleton<_i45.GetThemeAppUseCase>(
        () => _i45.GetThemeAppUseCase(gh<_i28.ISettingAppRepository>()));
    gh.lazySingleton<_i46.IChapterRepository>(
        () => _i47.ChapterRepositoryImp(gh<_i34.ChapterApiSource>()));
    gh.factory<_i48.LibraryScreenBloc>(() => _i48.LibraryScreenBloc(
          gh<_i37.FindListMangaLibraryUseCase>(),
          gh<_i18.WatchIdFavoriteTabUseCase>(),
        ));
    gh.factory<_i49.ListMangaBloc>(
        () => _i49.ListMangaBloc(gh<_i35.FetchListMangaUseCase>()));
    gh.factoryParam<_i50.MangaDetailBloc, String, dynamic>((
      endpoint,
      _,
    ) =>
        _i50.MangaDetailBloc(
          endpoint,
          gh<_i36.FetchMangaDetailUseCase>(),
        ));
    gh.factory<_i51.SearchScreenBloc>(
        () => _i51.SearchScreenBloc(gh<_i38.FindMangaByQueryUseCase>()));
    gh.factory<_i52.UpdateAppCubit>(() => _i52.UpdateAppCubit(
          gh<_i23.GetLatestReleaseUseCase>(),
          gh<_i23.GetDownloadPathUseCase>(),
        ));
    gh.factory<_i53.ChangeBackgroundBloc>(() => _i53.ChangeBackgroundBloc(
          gh<_i40.GetBackgroundReadingUseCase>(),
          gh<_i30.SetBackgroundReadingUseCase>(),
        ));
    gh.factory<_i54.ChangeReadingModeBloc>(() => _i54.ChangeReadingModeBloc(
          gh<_i44.GetReadingModeUseCase>(),
          gh<_i32.SetReadingModeUseCase>(),
        ));
    gh.factory<_i55.ChangeThemeBloc>(() => _i55.ChangeThemeBloc(
          gh<_i45.GetThemeAppUseCase>(),
          gh<_i33.SetThemeAppUseCase>(),
        ));
    gh.lazySingleton<_i56.FetchDataChapterUsecase>(
        () => _i56.FetchDataChapterUsecase(gh<_i57.IChapterRepository>()));
    gh.factory<_i58.ChapterScreenCubit>(
        () => _i58.ChapterScreenCubit(gh<_i59.FetchDataChapterUsecase>()));
    return this;
  }
}

class _$StorageModule extends _i60.StorageModule {}

class _$NetworkModule extends _i61.NetworkModule {}
