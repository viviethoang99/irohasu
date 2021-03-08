// Packages
import 'package:flutter/material.dart';

// Widget
import '../../constants/base_content.dart';
import '../../models/manga_detail_model.dart';
import '../../screens/index_screen/index_screen.dart';
import './widget/custom_button_reading_widget.dart';
import './widget/description_text_widget.dart';
import './widget/header_manga_detail.dart';
import './widget/list_chapter_widget.dart';

class MangaDetailLoadedScreen extends StatefulWidget {
  const MangaDetailLoadedScreen({Key key, this.data}) : super(key: key);
  final MangaDetailModel data;

  @override
  _MangaDetailLoadedScreenState createState() =>
      _MangaDetailLoadedScreenState();
}

class _MangaDetailLoadedScreenState extends State<MangaDetailLoadedScreen> {
  MangaDetailModel get data => widget.data;

  String _continueReading = Content.startReading;

  @override
  void initState() {
    super.initState();
    continueReading();
  }

  void continueReading() {
    if (data.listChapRead.isNotEmpty) {
      final _titleLastChapter = data.listChapter
          .firstWhere((chapter) => chapter.idChapter == data.listChapRead.last)
          .chapterTitle
          .split(' ');
      final _getIndexNumberLastChapter = _titleLastChapter.indexWhere(
              (element) =>
                  element.toLowerCase() == 'chương' ||
                  element.toLowerCase() == 'chapter') +
          1;
      final lastChapterNumber = _titleLastChapter[_getIndexNumberLastChapter]
          .replaceAll(':', '')
          .trim();
      _continueReading = 'TIẾP TỤC ĐỌC TỪ CHƯƠNG $lastChapterNumber';
    }
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
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(IndexScreen.routeName);
            }),
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
            HeaderMangaDetail(data: data),
            DescriptionTextWidget(
              text: data.description ?? '',
              listGenres: data.listGenres,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButtonReadingWidget(
                status: _continueReading,
                color: Colors.green,
                chapterList: data.listChapter,
              ),
            ),
            const SizedBox(height: 10),
            ListChapterWidget(data: data),
          ],
        ),
      ),
    );
  }
}
