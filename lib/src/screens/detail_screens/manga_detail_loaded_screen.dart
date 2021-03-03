// Packages
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// Widget
import '../../../src/constants/base_content.dart';
import '../../../src/models/manga_detail_model.dart';
import '../../../src/screens/index_screen/index_screen.dart';
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

  MangaDetailModel mangaDetail;

  final mangaBox = Hive.box<dynamic>('irohasu');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () =>
              Navigator.of(context).pushNamed(IndexScreen.routeName),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.get_app,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryColor,
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
            if (data.description.isNotEmpty)
              DescriptionTextWidget(text: data.description),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomButtonReadingWidget(
                    status: Content.startReading,
                    color: Colors.green,
                    chapterList: data.listChapter,
                  ),
                  CustomButtonReadingWidget(
                    status: Content.readComments,
                    color: Colors.amber,
                    chapterList: data.listChapter,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListChapterWidget(data: data),
          ],
        ),
      ),
    );
  }
}
