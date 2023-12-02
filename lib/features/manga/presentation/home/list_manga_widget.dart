import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manga.dart';
import './widget/item_manga.dart';

const _scrollThreshold = 300.0;

final class ListMangaWidget extends StatefulWidget {
  const ListMangaWidget({super.key});

  @override
  State<ListMangaWidget> createState() => _ListMangaWidgetState();
}

class _ListMangaWidgetState extends State<ListMangaWidget> {
  late final ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        final maxScrollExtent = _scrollController!.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;
        if (maxScrollExtent - currentScroll <= _scrollThreshold) {
          context.read<ListMangaBloc>().add(FetchListMangaEvent());
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListMangaBloc, ListMangaState>(
      builder: (context, state) {
        return GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: state.hasReachedMax
              ? state.listManga.length + 20
              : state.listManga.length,
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.6,
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          cacheExtent: 100,
          itemBuilder: (context, index) {
            final manga = state.listManga[index];
            return ItemManga(
              key: ValueKey(manga.idManga),
              title: manga.title,
              thumbnailUrl: manga.thumbnailUrl,
              endpoint: manga.endpoint,
            );
          },
        );
      },
    );
  }
}
