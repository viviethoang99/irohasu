// Packages
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../config/base_colors.dart';
import '../../../domain/entities/manga_detail.dart';
import 'widget/custom_button_reading_widget.dart';
import 'widget/description_text_widget.dart';
import 'widget/header_manga_detail.dart';
import 'widget/list_chapter_widget.dart';

class MangaDetailLoadedScreen extends StatefulWidget {
  const MangaDetailLoadedScreen({Key? key, this.data}) : super(key: key);

  final MangaDetail? data;

  @override
  State<MangaDetailLoadedScreen> createState() =>
      _MangaDetailLoadedScreenState();
}

class _MangaDetailLoadedScreenState extends State<MangaDetailLoadedScreen> {
  MangaDetail get data => widget.data!;
  late final Color _colorPage;
  late final Random random;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    random = Random();
    final indexColor = random.nextInt(AppColors.listColors.length);
    _colorPage = AppColors.listColors[indexColor];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.backgroundColor,
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: theme.primaryColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: innerBoxIsScrolled
                  ? Theme.of(context).backgroundColor
                  : Colors.transparent,
              floating: true,
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
              title: Text(
                innerBoxIsScrolled ? data.title : '',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderMangaDetail(
                color: _colorPage,
              ),
              DescriptionTextWidget(
                text: data.description ?? '',
                color: _colorPage,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomButtonReadingWidget(
                  lastChapter: data.listChapter.last,
                  color: _colorPage,
                ),
              ),
              const SizedBox(height: 10),
              ListChapterWidget(color: _colorPage),
            ],
          ),
        ),
      ),
    );
  }
}
