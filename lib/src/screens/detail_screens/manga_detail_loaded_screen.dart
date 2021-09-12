// Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/manga_detail_bloc/bloc.dart';
import '../../config/base_content.dart';
import '../../local/history_data.dart';
import '../../models/chapter_item_model.dart';
import '../../models/manga_detail_model.dart';
import '../../screens/chapter_screens/chapter_screen.dart';
import 'widget/custom_button_reading_widget.dart';
import 'widget/description_text_widget.dart';
import 'widget/header_manga_detail.dart';
import 'widget/list_chapter_widget.dart';

class MangaDetailLoadedScreen extends StatefulWidget {
  const MangaDetailLoadedScreen({Key? key, this.data}) : super(key: key);
  final MangaDetailModel? data;

  @override
  _MangaDetailLoadedScreenState createState() =>
      _MangaDetailLoadedScreenState();
}

class _MangaDetailLoadedScreenState extends State<MangaDetailLoadedScreen> {
  MangaDetailModel? get data => widget.data;

  String _continueReading = ConstantStrings.startReading;

  final List<String> _keywordChapter = ['chương', 'chapter', 'chap'];

  @override
  void initState() {
    super.initState();
    // continueReading();
  }

  // void continueReading() {
  //   if (data!.listChapRead!.isNotEmpty) {
  //     final _titleLastChapter = data!.listChapter!
  //         .firstWhere(
  //             (chapter) => chapter.idChapter == data!.listChapRead!.last)
  //         .title!
  //         .split(' ');
  //     final _getIndexNumberLastChapter = _titleLastChapter.indexWhere(
  //             (element) => _keywordChapter.contains(element.toLowerCase())) +
  //         1;
  //     if (_getIndexNumberLastChapter == 0) {
  //       _continueReading = 'TIẾP TỤC ĐỌC';
  //     } else {
  //       final lastChapter = _titleLastChapter[_getIndexNumberLastChapter]
  //           .replaceAll(':', '')
  //           .trim();
  //       _continueReading = 'TIẾP TỤC ĐỌC TỪ CHƯƠNG $lastChapter';
  //     }
  //   }
  // }

  void openChapter({required ChapterItem item, required BuildContext context}) {
    HistoryData.addChapToHistory(
      idManga: data!.idManga,
      idChapter: item.idChapter,
    );
    Navigator.of(context).pushNamed(
      ChapterScreen.routeName,
      arguments: ChapterScreen(endpoint: item.endpoint),
    );
    BlocProvider.of<MangaDetailBloc>(context)
        .add(AddChapterToListReading(data!.idManga));
  }

  @override
  void didUpdateWidget(covariant MangaDetailLoadedScreen oldWidget) {
    // continueReading();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: theme.primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: theme.primaryColor,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.get_app,
              color: theme.primaryColor,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: theme.primaryColor,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: MediaQuery.removePadding(
        removeTop: true,
        removeBottom: true,
        context: context,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            const HeaderMangaDetail(),
            DescriptionTextWidget(text: data!.description ?? ''),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButtonReadingWidget(
                status: _continueReading,
                lastChapter: data!.listChapter!.last,
                openChap: (ChapterItem item) => openChapter(
                  item: item,
                  context: context,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const ListChapterWidget(),
          ],
        ),
      ),
    );
  }
}
