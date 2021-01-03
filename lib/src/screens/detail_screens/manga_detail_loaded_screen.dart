// Packages
import 'package:flutter/material.dart';

import '../../../src/constants/base_content.dart';
import '../../../src/models/manga_detail_model.dart';
import '../../../src/screens/chapter_screens/chapter_screen.dart';
import '../../../src/screens/home_screens/home_screen.dart';

// Widget
import './widget/custom_button_reading_widget.dart';
import './widget/description_text_widget.dart';
import './widget/header_manga_detail.dart';

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
            DescriptionTextWidget(
              text: data.description,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomButtonReadingWidget(
                    status: Content.startReading,
                    color: Colors.green,
                    function: startReading,
                  ),
                  CustomButtonReadingWidget(
                      status: Content.readComments, color: Colors.amber),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${data.chapter.length} Chapters',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.text_rotate_vertical,
                    color: Colors.green,
                    size: 26,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: Colors.amber,
                height: 4,
              ),
            ),
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                    color: Colors.white54,
                  ),
                  shrinkWrap: true,
                  itemCount: data.chapter.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      dense: true,
                      title: Text(
                        data.chapter[index].chapterTitle.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        data.chapter[index].chapterUpload.toString(),
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 18,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_circle_down,
                        color: Colors.green,
                        size: 30,
                      ),
                      isThreeLine: true,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ChapterScreen.routeName,
                          arguments: ChapterScreen(
                            endpoint:
                            data.chapter[index].chapterEndpoint.toString(),
                            chapterList: data.chapter,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startReading() {
    print('Test');
    Navigator.of(context).pushNamed(
      ChapterScreen.routeName,
      arguments: ChapterScreen(
        endpoint:
        data.chapter[1].chapterEndpoint.toString(),
        chapterList: data.chapter,
      ),
    );
  }
}
