// Packages
import 'package:flutter/material.dart';
import 'package:irohasu/src/helper/size_config.dart';

import '../../models/manga_detail_model.dart';
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

  @override
  void initState() {
    super.initState();
    // continueReading();
  }

  @override
  void didUpdateWidget(covariant MangaDetailLoadedScreen oldWidget) {
    // continueReading();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                lastChapter: data!.listChapter!.last,
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
