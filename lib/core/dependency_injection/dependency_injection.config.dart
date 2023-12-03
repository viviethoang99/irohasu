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
    as _i52;
import '../../features/chapter/application/change_reading_mode_bloc/change_reading_mode_bloc.dart'
    as _i53;
import '../../features/chapter/application/chapter_screen/chapter_screen_cubit.dart'
    as _i57;
import '../../features/chapter/application/manage_page_in_chapter/manage_page_in_chapter_cubit.dart'
    as _i16;
import '../../features/chapter/chapter.dart' as _i58;
import '../../features/chapter/data/datasource/remote/chapter_api_source.dart'
    as _i33;
import '../../features/chapter/data/repositories/chapter_repository_imp.dart'
    as _i46;
import '../../features/chapter/domain/domain.dart' as _i56;
import '../../features/chapter/domain/repository/i_chaper_repository.dart'
    as _i45;
import '../../features/chapter/domain/usecase/chapter/fetch_data_chapter_usecase.dart'
    as _i55;
import '../../features/github/application/update_app/update_app_cubit.dart'
    as _i51;
import '../../features/github/data/datasource/local/github_local_datasource.dart'
    as _i9;
import '../../features/github/data/datasource/remote/github_api_source.dart'
    as _i21;
import '../../features/github/data/repositories/github_repository_imp.dart'
    as _i23;
import '../../features/github/domain/repository/i_github_repository.dart'
    as _i42;
import '../../features/github/domain/usecase/github_usecase/get_latest_release_usecase.dart'
    as _i41;
import '../../features/github/domain/usecase/setting_usecase/get_download_path_usecase.dart'
    as _i40;
import '../../features/github/github.dart' as _i22;
import '../../features/manga/application/library_screen_bloc/library_screen_bloc.dart'
    as _i47;
import '../../features/manga/application/list_manga_bloc/list_manga_bloc.dart'
    as _i48;
import '../../features/manga/application/manage_favorite_manga/manage_favorite_manga_bloc.dart'
    as _i15;
import '../../features/manga/application/manga_detail_bloc/manga_detail_bloc.dart'
    as _i49;
import '../../features/manga/application/search_screen/search_screen_bloc.dart'
    as _i50;
import '../../features/manga/data/datasource/local/favorite_local_source.dart'
    as _i6;
import '../../features/manga/data/datasource/local/manga_local_source.dart'
    as _i11;
import '../../features/manga/data/datasource/remote/manga_api_source.dart'
    as _i24;
import '../../features/manga/data/dtos/dtos.dart' as _i12;
import '../../features/manga/data/repositories/favorite_repository.dart' as _i8;
import '../../features/manga/data/repositories/manga_repository_imp.dart'
    as _i26;
import '../../features/manga/domain/repositories/i_favorite_repository.dart'
    as _i7;
import '../../features/manga/domain/repositories/i_manga_repository.dart'
    as _i25;
import '../../features/manga/domain/usecase/favorite_manga/change_status_favorite_usercase.dart'
    as _i20;
import '../../features/manga/domain/usecase/favorite_manga/find_list_manga_library_usecase.dart'
    as _i36;
import '../../features/manga/domain/usecase/favorite_manga/get_all_manga_usecase.dart'
    as _i38;
import '../../features/manga/domain/usecase/favorite_manga/is_favorite_usecase.dart'
    as _i14;
import '../../features/manga/domain/usecase/favorite_manga/watch_id_favorite_tab_usecase.dart'
    as _i18;
import '../../features/manga/domain/usecase/list_manga/fetch_list_manga_usecase.dart'
    as _i34;
import '../../features/manga/domain/usecase/list_manga/find_manga_by_query_usecase.dart'
    as _i37;
import '../../features/manga/domain/usecase/manga_detail/fetch_manga_detail_usecase.dart'
    as _i35;
import '../../features/manga/manga.dart' as _i5;
import '../../features/shared/application/change_theme_bloc/change_theme_bloc.dart'
    as _i54;
import '../../features/shared/data/datasource/local/setting_local_datasource.dart'
    as _i13;
import '../../features/shared/data/repositories/setting_app_repository.dart'
    as _i28;
import '../../features/shared/domain/repositories/i_setting_app_repository.dart'
    as _i27;
import '../../features/shared/domain/repositories/repository.dart' as _i30;
import '../../features/shared/domain/usecase/setting_app/get_background_reading_usecase.dart'
    as _i39;
import '../../features/shared/domain/usecase/setting_app/get_reading_mode_usecase.dart'
    as _i43;
import '../../features/shared/domain/usecase/setting_app/get_setting_app_usecase.dart'
    as _i44;
import '../../features/shared/domain/usecase/setting_app/update_background_reading_usecase.dart'
    as _i29;
import '../../features/shared/domain/usecase/setting_app/update_reading_mode_usecase.dart'
    as _i31;
import '../../features/shared/domain/usecase/setting_app/update_setting_app_usecase.dart'
    as _i32;
import 'modules/network_module.dart' as _i60;
import 'modules/storage_module.dart' as _i59;

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
    gh.factory<_i21.IGithubApiSource>(
        () => _i21.GithubApiSource(gh<_i19.Dio>()));
    gh.factory<_i22.IGithubRepository>(() => _i23.GithubRepository(
          gh<_i22.IGithubApiSource>(),
          gh<_i22.IGithubLocalDataSource>(),
        ));
    gh.factory<_i24.IMangaApiSource>(() => _i24.MangaApiSource(gh<_i19.Dio>()));
    gh.lazySingleton<_i25.IMangaRepository>(() => _i26.MangaRepository(
          gh<_i24.IMangaApiSource>(),
          gh<_i11.IMangaLocalSource>(),
        ));
    gh.factory<_i27.ISettingAppRepository>(
        () => _i28.SettingAppRepository(gh<_i13.ISettingLocalDataSource>()));
    gh.lazySingleton<_i29.SetBackgroundReadingUseCase>(() =>
        _i29.SetBackgroundReadingUseCase(gh<_i30.ISettingAppRepository>()));
    gh.lazySingleton<_i31.SetReadingModeUseCase>(
        () => _i31.SetReadingModeUseCase(gh<_i27.ISettingAppRepository>()));
    gh.lazySingleton<_i32.SetThemeAppUseCase>(
        () => _i32.SetThemeAppUseCase(gh<_i27.ISettingAppRepository>()));
    gh.factory<_i33.ChapterApiSource>(
        () => _i33.ChapterApiSource(gh<_i19.Dio>()));
    gh.lazySingleton<_i34.FetchListMangaUseCase>(
        () => _i34.FetchListMangaUseCase(gh<_i25.IMangaRepository>()));
    gh.lazySingleton<_i35.FetchMangaDetailUseCase>(
        () => _i35.FetchMangaDetailUseCase(gh<_i25.IMangaRepository>()));
    gh.lazySingleton<_i36.FindListMangaLibraryUseCase>(
        () => _i36.FindListMangaLibraryUseCase(gh<_i25.IMangaRepository>()));
    gh.lazySingleton<_i37.FindMangaByQueryUseCase>(
        () => _i37.FindMangaByQueryUseCase(gh<_i25.IMangaRepository>()));
    gh.lazySingleton<_i38.GetAllMangaUseCase>(
        () => _i38.GetAllMangaUseCase(gh<_i25.IMangaRepository>()));
    gh.lazySingleton<_i39.GetBackgroundReadingUseCase>(() =>
        _i39.GetBackgroundReadingUseCase(gh<_i30.ISettingAppRepository>()));
    gh.lazySingleton<_i40.GetDownloadPathUseCase>(
        () => _i40.GetDownloadPathUseCase(gh<_i22.IGithubRepository>()));
    gh.lazySingleton<_i41.GetLatestReleaseUseCase>(
        () => _i41.GetLatestReleaseUseCase(gh<_i42.IGithubRepository>()));
    gh.lazySingleton<_i43.GetReadingModeUseCase>(
        () => _i43.GetReadingModeUseCase(gh<_i27.ISettingAppRepository>()));
    gh.lazySingleton<_i44.GetThemeAppUseCase>(
        () => _i44.GetThemeAppUseCase(gh<_i27.ISettingAppRepository>()));
    gh.lazySingleton<_i45.IChapterRepository>(
        () => _i46.ChapterRepositoryImp(gh<_i33.ChapterApiSource>()));
    gh.factory<_i47.LibraryScreenBloc>(() => _i47.LibraryScreenBloc(
          gh<_i36.FindListMangaLibraryUseCase>(),
          gh<_i18.WatchIdFavoriteTabUseCase>(),
        ));
    gh.factory<_i48.ListMangaBloc>(
        () => _i48.ListMangaBloc(gh<_i34.FetchListMangaUseCase>()));
    gh.factory<_i49.MangaDetailBloc>(() => _i49.MangaDetailBloc(
          gh<_i35.FetchMangaDetailUseCase>(),
          gh<_i20.ChangeStatusFavoriteUseCase>(),
          gh<_i14.IsFavoriteUseCase>(),
        ));
    gh.factory<_i50.SearchScreenBloc>(
        () => _i50.SearchScreenBloc(gh<_i37.FindMangaByQueryUseCase>()));
    gh.factory<_i51.UpdateAppCubit>(() => _i51.UpdateAppCubit(
          gh<_i22.GetLatestReleaseUseCase>(),
          gh<_i22.GetDownloadPathUseCase>(),
        ));
    gh.factory<_i52.ChangeBackgroundBloc>(() => _i52.ChangeBackgroundBloc(
          gh<_i39.GetBackgroundReadingUseCase>(),
          gh<_i29.SetBackgroundReadingUseCase>(),
        ));
    gh.factory<_i53.ChangeReadingModeBloc>(() => _i53.ChangeReadingModeBloc(
          gh<_i43.GetReadingModeUseCase>(),
          gh<_i31.SetReadingModeUseCase>(),
        ));
    gh.factory<_i54.ChangeThemeBloc>(() => _i54.ChangeThemeBloc(
          gh<_i44.GetThemeAppUseCase>(),
          gh<_i32.SetThemeAppUseCase>(),
        ));
    gh.lazySingleton<_i55.FetchDataChapterUsecase>(
        () => _i55.FetchDataChapterUsecase(gh<_i56.IChapterRepository>()));
    gh.factory<_i57.ChapterScreenCubit>(
        () => _i57.ChapterScreenCubit(gh<_i58.FetchDataChapterUsecase>()));
    return this;
  }
}

class _$StorageModule extends _i59.StorageModule {}

class _$NetworkModule extends _i60.NetworkModule {}
