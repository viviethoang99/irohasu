// Packages
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/base_colors.dart';
import '../../../../core/core.dart';
import '../../../../env.dart';
import '../../manga.dart';
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
      body: Stack(
        children: [
          _ImageBackgroundWidget(color: _colorPage),
          NestedScrollView(
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
                  CustomButtonReadingWidget(
                    lastChapter: data.listChapter.last,
                    color: _colorPage,
                  ),
                  ListChapterWidget(color: _colorPage),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageBackgroundWidget extends StatelessWidget {
  const _ImageBackgroundWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rectangle) {
        return const LinearGradient(
          colors: [Colors.black, Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(
          Rect.fromLTRB(0, 0, rectangle.width, rectangle.height),
        );
      },
      blendMode: BlendMode.dstIn,
      child: BlocBuilder<MangaDetailBloc, MangaDetailState>(
        buildWhen: (pre, cur) => pre.runtimeType != cur.runtimeType,
        builder: (context, state) {
          if (state is MangaDetailSuccessState) {
            return CachedNetworkImage(
              imageUrl: state.mangaDetail.thumbnailUrl,
              imageBuilder: (context, imageProvider) => Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight / 2.5,
                decoration: BoxDecoration(
                  color: color,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fitWidth,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.35),
                      BlendMode.dstATop,
                    ),
                  ),
                ),
              ),
              httpHeaders: ENV.headersBuilder,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (_, url, error) => const Icon(Icons.error),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
