import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/manga_detail_bloc/bloc.dart';
import '../../local/cache_manager_data.dart';
//
import '../../widgets/loading_screen.dart';
import 'manga_detail_loaded_screen.dart';

class MangaDetailScreen extends StatefulWidget {
  const MangaDetailScreen({Key? key, this.endpoint}) : super(key: key);

  static const routeName = '/mangaDetail';
  final String? endpoint;

  @override
  _MangaDetailScreenState createState() => _MangaDetailScreenState();
}

class _MangaDetailScreenState extends State<MangaDetailScreen> {
  late final CacheManagerData _cacheManagerData;

  String? get endpoint => widget.endpoint;
  String? idManga;

  @override
  void initState() {
    super.initState();
    _cacheManagerData = CacheManagerData();
    BlocProvider.of<MangaDetailBloc>(context)
        .add(FetchMangaDetailEvent(endpoint));
  }

  @override
  void dispose() {
    super.dispose();
    removeCacheData();
  }

  Future removeCacheData() async {
    final detailManga = await (_cacheManagerData.getMangaRequestData(idManga));
    if (detailManga?.data.isFavorite != true &&
        detailManga!.data.listChapRead!.isEmpty &&
        detailManga.data.listDownload!.isEmpty) {
      await _cacheManagerData.removeMangaRequestSingleCache(idManga);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaDetailBloc, MangaDetailState>(
      builder: (context, state) {
        if (state is MangaDetailLoadingState) {
          return LoadingScreen();
        }
        if (state is InitialMangaDetailState) {
          return const Center();
        }
        if (state is MangaDetailLoadedState) {
          idManga = state.data!.idManga;
          return MangaDetailLoadedScreen(data: state.data);
        }
        if (state is MangaDetailSyncState) {
          _cacheManagerData.writeMangaRequestDataWithTime(state.data!);
          idManga = state.data!.idManga;
          return MangaDetailLoadedScreen(data: state.data);
        }
        if (state is MangaDetailFailureState) {
          Navigator.of(context).pop();
        }
        return Container();
      },
    );
  }
}
