import 'dart:io' as io;
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/core.dart';
import '../../../../env.dart';
import '../../../domain/entities/chapter.dart';
import '../../../domain/entities/chapter_item.dart';
import 'webtoon_screen_widget/app_bar_widget.dart';
import 'webtoon_screen_widget/bottom_bar_widget.dart';
import 'webtoon_screen_widget/custom_drawer.dart';

class ChapterLoadedScreen extends StatefulWidget {
  const ChapterLoadedScreen({
    Key? key,
    required this.data,
    this.chapterList = const [],
    required this.getIndexChapter,
  }) : super(key: key);

  final Chapter? data;
  final List<ChapterItem>? chapterList;
  final int getIndexChapter;

  @override
  State<ChapterLoadedScreen> createState() => _ChapterLoadedScreenState();
}

class _ChapterLoadedScreenState extends State<ChapterLoadedScreen> {
  List get _getChapterList => widget.chapterList!.toList();

  Chapter? get data => widget.data;
  int get getIndex => widget.getIndexChapter;

  late final ScrollController _scrollController;
  final scrollDirection = Axis.vertical;
  ItemScrollController? _scrollListController;
  int? countImage = 0;

  //Declare Globaly
  String? directory;
  List file = <File>[];

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
        backgroundColor: Colors.white,
        body: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              loadImageNetwork(),
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
              ),
            ],
          );
        }),
        drawer: CustomDrawer(
          scrollListController: _scrollListController,
          getIndex: getIndex,
          getChapterList: _getChapterList,
        ),
      ),
    );
  }

  Widget loadImageNetwork() {
    return InteractiveViewer(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 56),
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: data!.listImage![index].urlImage!,
            httpHeaders: ENV.headersBuilder,
            placeholder: (context, string) => SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: const Center(
                heightFactor: 70,
                widthFactor: 70,
                child: CircularProgressIndicator(),
              ),
            ),
            fadeInDuration: const Duration(milliseconds: 100),
            errorWidget: (context, string, e) => const Icon(Icons.error),
          );
        },
        itemCount: data!.listImage!.length,
      ),
    );
  }

  Widget loadImageDownload() {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 56),
      physics: const ClampingScrollPhysics(),
      controller: _scrollController,
      itemBuilder: (context, index) => Image.file(file[index]),
      itemCount: countImage,
    );
  }
}
