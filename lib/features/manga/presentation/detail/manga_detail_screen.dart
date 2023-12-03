import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../manga.dart';

import 'manga_detail_loaded_screen.dart';

class MangaDetailScreen extends StatefulWidget {
  const MangaDetailScreen({
    super.key,
    required this.mangaDetail,
  });

  static const routeName = '/mangaDetail';
  final MangaDetail? mangaDetail;

  @override
  State<MangaDetailScreen> createState() => _MangaDetailScreenState();
}

class _MangaDetailScreenState extends State<MangaDetailScreen> {
  late final Color _colorPage;
  late final MangaDetailBloc _bloc;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _randomColor();
    _createBloc();
    super.initState();
  }

  void _randomColor() {
    final random = Random();
    final indexColor = random.nextInt(AppColors.listColors.length);

    _colorPage = AppColors.listColors[indexColor];
  }

  void _createBloc() {
    _bloc = getIt<MangaDetailBloc>()
      ..add(InitMangaDetailEvent(widget.mangaDetail))
      ..add(FetchMangaDetailEvent(widget.mangaDetail?.endpoint));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Theme.of(context).copyWith(
      canvasColor: _colorPage,
    );

    return Theme(
      data: theme,
      child: BlocProvider<MangaDetailBloc>(
        create: (_) => _bloc,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          body: BlocSelector<MangaDetailBloc, MangaDetailState, MangaDetail?>(
            selector: (state) => state.mangaDetail,
            builder: (context, mangaDetail) {
              if (mangaDetail != null) {
                return MangaDetailView(data: mangaDetail);
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
