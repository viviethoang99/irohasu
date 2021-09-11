import 'dart:io' as io;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../env.dart';
import '../../helper/alphanum_comparator.dart';
import '../../models/chapter_item_model.dart';
import '../../models/chapter_model.dart';
import 'webtoon_screen_widget/app_bar_widget.dart';
import 'webtoon_screen_widget/bottom_bar_widget.dart';
import 'webtoon_screen_widget/custom_drawer.dart';

class ChapterLoadedScreen extends StatefulWidget {
  const ChapterLoadedScreen({
    required this.data,
    this.chapterList = const [],
    required this.getIndexChapter,
    required this.openChapter,
  });

  final ChapterModel? data;
  final List<ChapterItem>? chapterList;
  final int getIndexChapter;
  final Function openChapter;

  @override
  _ChapterLoadedScreenState createState() => _ChapterLoadedScreenState();
}

class _ChapterLoadedScreenState extends State<ChapterLoadedScreen> {
  List get _getChapterList => widget.chapterList!.toList();

  ChapterModel? get data => widget.data;
  int get getIndex => widget.getIndexChapter;

  late final ScrollController _scrollController;
  final scrollDirection = Axis.vertical;
  ItemScrollController? _scrollListController;
  int? countImage = 0;

  //Declare Globaly
  String? directory;
  List file = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollListController = ItemScrollController();
    _getChapterList[getIndex]?.isDownload != null
        ? _listofFiles()
        : setState(() => countImage = data!.listImage!.length);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ChapterLoadedScreen oldWidget) {
    _getChapterList[getIndex]?.isDownload != null
        ? _listofFiles()
        : setState(
            () => countImage = data!.listImage!.length,
          );
    super.didUpdateWidget(oldWidget);
  }

  void _listofFiles() async {
    final directory = (await getApplicationDocumentsDirectory()).absolute.path;
    setState(() {
      file = io.Directory(directory + _getChapterList[getIndex].isDownload)
          .listSync()
            ..sort((a, b) => AlphanumComparator.compare(a.path, b.path));
      countImage = file.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              (file.isNotEmpty) ? loadImageDownload() : loadImageNetwork(),
              AppBarChapterScreen(
                maxWidth: constraints.maxWidth,
                scrollController: _scrollController,
              ),
              BottomBarChapterScreen(
                countChapter: _getChapterList.length,
                maxWidth: constraints.maxWidth,
                getIndex: getIndex,
                scrollController: _scrollController,
                scrollListController: _scrollListController,
                openChapter: widget.openChapter,
              ),
            ],
          );
        }),
        drawer: CustomDrawer(
          scrollListController: _scrollListController,
          getIndex: getIndex,
          getChapterList: _getChapterList,
          openChapter: widget.openChapter,
        ),
      ),
    );
  }

  Widget loadImageNetwork() {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 56),
          physics: const ClampingScrollPhysics(),
          controller: _scrollController,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: data!.listImage![index].chapterImageLink!,
              httpHeaders: ENV.headersBuilder,
            );
          },
          itemCount: countImage),
    );
  }

  Widget loadImageDownload() {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 56),
        physics: const ClampingScrollPhysics(),
        controller: _scrollController,
        itemBuilder: (context, index) => Image.file(file[index]),
        itemCount: countImage,
      ),
    );
  }
}
