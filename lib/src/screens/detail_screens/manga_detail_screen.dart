import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  MangaDetailBloc _mangaDetailBloc;

  String get endpoint => widget.endpoint;

  @override
  void initState() {
    super.initState();
    _mangaDetailBloc = BlocProvider.of<MangaDetailBloc>(context)
      ..add(FetchMangaDetailEvent(endpoint));
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
        if (state is MangaDetailFailureState) {
          Navigator.of(context).pop();
        }
        return const Center(child: Text('Other states..'));
      },
    );
  }
}