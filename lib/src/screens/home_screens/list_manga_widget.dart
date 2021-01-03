import 'package:flutter/material.dart';

import '../../../src/models/list_manga_model.dart';
import 'item_manga.dart';

class ListMangaWidget extends StatefulWidget {
  const ListMangaWidget(
      {Key key, this.scrollController, this.data, this.hasReachedEnd})
      : super(key: key);

  final ScrollController scrollController;
  final List<ListManga> data;
  final bool hasReachedEnd;

  @override
  _ListMangaWidgetState createState() => _ListMangaWidgetState();
}

class _ListMangaWidgetState extends State<ListMangaWidget> {
  List<ListManga> get data => widget.data;
  ScrollController get _scrollController => widget.scrollController;
  bool get hasReachedEnd => widget.hasReachedEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black87),
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(12),
        itemCount:
            hasReachedEnd ? data.length + 20 : data.length,
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6,
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return ItemManga(
            title: data[index].title,
            thumbnailUrl: data[index].thumbnailUrl,
            setUrlWithoutDomain: data[index].setUrlWithoutDomain,
          );
        },
      ),
    );
  }
}