import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irohasu/src/service/cache_manager_data.dart';

//
import '../../../src/components/loading_screen.dart';
import '../../blocs/manga_detail_bloc/bloc.dart';
import 'manga_detail_loaded_screen.dart';

class MangaDetailScreen extends StatefulWidget {
  const MangaDetailScreen({Key key, this.endpoint}) : super(key: key);

  static const routeName = '/mangaDetail';
  final String endpoint;

  @override
  _MangaDetailScreenState createState() => _MangaDetailScreenState();
}

class _MangaDetailScreenState extends State<MangaDetailScreen> {
  final _cacheManagerData = CacheManagerData();

  String get endpoint => widget.endpoint;
  String idManga;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MangaDetailBloc>(context)
      ..add(FetchMangaDetailEvent(endpoint));
  }

  @override
  void dispose() {
    super.dispose();
    removeCacheData();
  }

  Future removeCacheData() async {
    final detailManga = await _cacheManagerData.getMangaRequestData(idManga);
    if (detailManga.data.isFavorite != true &&
        detailManga.data.listChapRead.isEmpty &&
        detailManga.data.listDownload.isEmpty) {
      await _cacheManagerData.removeMangaRequestSingleCache(idManga);
      print('Remove success cache ${detailManga.data.title}');
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
          return MangaDetailLoadedScreen(data: state.data);
        }
        if (state is MangaDetailSyncState) {
          _cacheManagerData.writeMangaRequestDataWithTime(state.data);
          idManga = state.data.idManga;
          return MangaDetailLoadedScreen(data: state.data);
        }
        if (state is MangaDetailFailureState) {
          Navigator.of(context).pop();
        }
        return const Center(child: Text('Other states..'));
      },
    );
  }
}
