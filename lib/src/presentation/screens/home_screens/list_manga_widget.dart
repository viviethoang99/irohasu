import 'package:flutter/material.dart';

import './widget/item_manga.dart';
import '../../../../core/core.dart';
import '../../../data/model/manga_list_model.dart';

class ListMangaWidget extends StatefulWidget {
  const ListMangaWidget({
    Key? key,
    this.scrollController,
    this.data,
    this.hasReachedEnd,
  }) : super(key: key);

  final ScrollController? scrollController;
  final List<MangaModel>? data;
  final bool? hasReachedEnd;

  @override
  _ListMangaWidgetState createState() => _ListMangaWidgetState();
}

class _ListMangaWidgetState extends State<ListMangaWidget> {
  List<MangaModel>? get data => widget.data;

  ScrollController? get _scrollController => widget.scrollController;

  bool? get hasReachedEnd => widget.hasReachedEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.getHeight(context),
      color: Theme.of(context).backgroundColor,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        itemCount: hasReachedEnd! ? data!.length + 20 : data!.length,
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6,
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return ItemManga(
            title: data![index].title,
            thumbnailUrl: data![index].thumbnailUrl,
            endpoint: data![index].endpoint,
          );
        },
      ),
    );
  }
}
