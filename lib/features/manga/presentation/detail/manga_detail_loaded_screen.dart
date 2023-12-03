import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/text.dart';
import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../../../env.dart';
import '../../manga.dart';

import 'widget/custom_button_reading_widget.dart';
import 'widget/description_text_widget.dart';
import 'widget/header_manga_detail.dart';
import 'widget/list_chapter_widget.dart';

class MangaDetailView extends StatelessWidget {
  const MangaDetailView({super.key, this.data});

  final MangaDetail? data;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Stack(
      children: [
        const _ImageBackgroundWidget(),
        NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              _SliverAppBar(
                innerBoxIsScrolled: innerBoxIsScrolled,
                title: data?.title ?? '',
              )
            ];
          },
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const HeaderMangaDetail(),
                DescriptionTextWidget(
                  key: ValueKey(data?.description?.length),
                  text: data?.description,
                ),
                CustomButtonReadingWidget(
                  lastChapter: (data?.listChapter ?? []).isNotEmpty
                      ? data!.listChapter.last
                      : null,
                ),
                const ListChapterWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({
    this.innerBoxIsScrolled = false,
    this.title = '',
  });

  final bool innerBoxIsScrolled;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: theme.primaryColor,
        ),
        onPressed: Navigator.of(context).pop,
      ),
      backgroundColor: innerBoxIsScrolled
          ? Theme.of(context).colorScheme.background
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
      title: IrohaText.regular(
        innerBoxIsScrolled ? title : '',
        fontSize: FontSizes.s16,
      ),
    );
  }
}

class _ImageBackgroundWidget extends StatelessWidget {
  const _ImageBackgroundWidget();

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
      child: BlocSelector<MangaDetailBloc, MangaDetailState, String>(
        selector: (state) => state.mangaDetail?.thumbnailUrl ?? '',
        builder: (context, thumbnailUrl) {
          if (thumbnailUrl.isNotEmpty) {
            return CachedNetworkImage(
              imageUrl: thumbnailUrl,
              imageBuilder: (context, imageProvider) => Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight / 2.5,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
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
