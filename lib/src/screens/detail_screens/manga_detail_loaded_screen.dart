// Packages
import 'package:flutter/material.dart';
//
import '../../../src/constants/base_content.dart';
import '../../../src/models/manga_detail_model.dart';
import '../../../src/screens/detail_screens/widget/appbar_chapter_widget.dart';
import '../../../src/screens/home_screens/home_screen.dart';
// Widget
import './widget/custom_button_reading_widget.dart';
import './widget/description_text_widget.dart';
import './widget/header_manga_detail.dart';
import './widget/list_chapter_widget.dart';

class MangaDetailLoadedScreen extends StatefulWidget {
  const MangaDetailLoadedScreen({Key key, this.data}) : super(key: key);
  final MangaDetail data;

  @override
  _MangaDetailLoadedScreenState createState() =>
      _MangaDetailLoadedScreenState();
}

class _MangaDetailLoadedScreenState extends State<MangaDetailLoadedScreen> {
  MangaDetail get data => widget.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black87,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () =>
                Navigator.of(context).pushNamed(HomeScreen.routeName)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          const IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          const IconButton(
            icon: Icon(
              Icons.get_app,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          const IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
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
            HeaderMangaDetail(
              title: data.title,
              author: data.author,
              status: data.status,
              thumbnailUrl: data.thumb,
              like: data.like,
              dislike: data.dislike,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 10),
              child: Row(
                children: <Widget>[
                  const IconButton(
                    icon: Icon(
                      Icons.cloud,
                      color: Colors.green,
                      size: 38,
                    ),
                    onPressed: null,
                  ),
                  const IconButton(
                    icon: Icon(
                      Icons.language,
                      color: Colors.green,
                      size: 38,
                    ),
                    onPressed: null,
                  ),
                  const IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.green,
                      size: 38,
                    ),
                    onPressed: null,
                  ),
                ],
              ),
            ),
            DescriptionTextWidget(text: data.description),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomButtonReadingWidget(
                    status: Content.startReading,
                    color: Colors.green,
                    chapterList: data.chapter,
                  ),
                  CustomButtonReadingWidget(
                    status: Content.readComments,
                    color: Colors.amber,
                    chapterList: data.chapter,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            AppbarChapterWidget(data: data),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(color: Colors.amber, height: 4)),
            ListChapterWidget(data: data),
          ],
        ),
      ),
    );
  }
}

