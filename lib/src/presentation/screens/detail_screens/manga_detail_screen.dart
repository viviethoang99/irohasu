import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/manga_detail_bloc/bloc.dart';
import '../../widgets/loading_screen.dart';

import 'manga_detail_loaded_screen.dart';

class MangaDetailScreen extends StatefulWidget {
  const MangaDetailScreen({
    Key? key,
    required this.endpoint,
  }) : super(key: key);

  static const routeName = '/mangaDetail';
  final String endpoint;

  @override
  _MangaDetailScreenState createState() => _MangaDetailScreenState();
}

class _MangaDetailScreenState extends State<MangaDetailScreen> {
  @override
  void initState() {
    context.read<MangaDetailBloc>().add(FetchMangaDetailEvent(widget.endpoint));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MangaDetailBloc, MangaDetailState>(
      listenWhen: (pre, cur) => pre.runtimeType != cur.runtimeType,
      listener: (context, state) {
        if (state is MangaDetailFailureState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is MangaDetailLoadingState) {
          return LoadingScreen();
        }
        if (state is MangaDetailSuccessState) {
          return MangaDetailLoadedScreen(data: state.mangaDetail);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
