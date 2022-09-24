import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../env.dart';
import '../../../../shared/shared.dart';
import '../../../manga.dart';
import 'btn_vote_widget.dart';

class HeaderMangaDetail extends StatelessWidget {
  const HeaderMangaDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaDetailBloc, MangaDetailState>(
      builder: (context, state) {
        if (state is MangaDetailLoadingState) {
          final data = state.params;
          return Stack(
            children: <Widget>[
              _ImageBackgroundWidget(
                key: ValueKey('$_ImageBackgroundWidget ${data.urlImage}'),
                color: state.colorManga,
                thumbnailUrl: data.urlImage,
              ),
              Column(
                children: [
                  const SizedBox(height: 50),
                  _InfomationMangaWidget(
                    key: ValueKey(data.endpoint.toId),
                    thumbnailUrl: data.urlImage,
                    title: data.name,
                  ),
                  btnSocialWidget(state.colorManga),
                ],
              ),
            ],
          );
        }
        if (state is MangaDetailSuccessState) {
          final data = state.mangaDetail;
          return Stack(
            children: <Widget>[
              _ImageBackgroundWidget(
                key: ValueKey('$_ImageBackgroundWidget ${data.thumbnailUrl}'),
                color: state.colorManga,
                thumbnailUrl: data.thumbnailUrl,
              ),
              Column(
                children: [
                  const SizedBox(height: 50),
                  _InfomationMangaWidget(
                    key: ValueKey(data.endpoint.toId),
                    status: data.status,
                    thumbnailUrl: data.thumbnailUrl,
                    author: data.author,
                    title: data.title,
                  ),
                  btnSocialWidget(state.colorManga),
                ],
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget btnSocialWidget(Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: <Widget>[
          BlocBuilder<FavoriteMangaDetailBloc, bool>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state ? Icons.favorite : Icons.favorite_border,
                  color: color,
                  size: 30,
                ),
                onPressed: () => context
                    .read<FavoriteMangaDetailBloc>()
                    .add(SetStatusFavoriteManga()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.language,
              color: color,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.share,
              color: color,
              size: 30,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class _InfomationMangaWidget extends StatelessWidget {
  const _InfomationMangaWidget({
    super.key,
    this.author = '',
    this.status = '',
    this.title = '',
    this.thumbnailUrl = '',
  });

  final String? title;
  final String? thumbnailUrl;
  final String? author;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: thumbnailUrl ?? DateTime.now().toString(),
          child: Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: thumbnailUrl!,
                httpHeaders: ENV.headersBuilder,
                fit: BoxFit.cover,
                height: SizeConfig.screenHeight / 5,
                width: SizeConfig.screenWidth / 3.5,
              ),
            ),
          ),
        ),
        Flexible(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: Text(
                    title!,
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  author!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  status!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                  ),
                ),
                const BtnVoteWidget()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ImageBackgroundWidget extends StatelessWidget {
  const _ImageBackgroundWidget({
    super.key,
    this.thumbnailUrl = '',
    required this.color,
  });

  final String thumbnailUrl;
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
      child: CachedNetworkImage(
        imageUrl: thumbnailUrl,
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
        placeholder: (context, url) => IrohaShimmer(
          child: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight / 2.5,
            decoration: BoxDecoration(
              color: color,
            ),
          ),
        ),
        errorWidget: (_, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
