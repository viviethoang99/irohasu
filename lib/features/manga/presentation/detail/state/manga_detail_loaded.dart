// Packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manga.dart';
import '../widget/custom_button_reading_widget.dart';
import '../widget/description_text_widget.dart';
import '../widget/header_manga_detail.dart';
import '../widget/list_chapter_widget.dart';

class MangaDetailLoaded extends StatelessWidget {
  const MangaDetailLoaded({Key? key, this.data}) : super(key: key);

  final MangaDetail? data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.backgroundColor,
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            BlocBuilder<MangaDetailBloc, MangaDetailState>(
              builder: (context, state) {
                return SliverAppBar(
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
                        Icons.more_vert,
                        color: theme.primaryColor,
                      ),
                      onPressed: null,
                    ),
                  ],
                  title: Text(
                    innerBoxIsScrolled ? data!.title : '',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                );
              },
            )
          ];
        },
        body: SingleChildScrollView(
          child: BlocBuilder<MangaDetailBloc, MangaDetailState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HeaderMangaDetail(),
                  DescriptionTextWidget(
                    text: data!.description ?? '',
                    color: state.colorManga,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomButtonReadingWidget(
                      lastChapter: data!.listChapter.last,
                      color: state.colorManga,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListChapterWidget(
                    color: state.colorManga,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
