import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../env.dart';
import '../../../blocs/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart';
import '../../../blocs/manga_detail_bloc/manga_detail_bloc.dart';
import 'btn_vote_widget.dart';

class HeaderMangaDetail extends StatelessWidget {
  const HeaderMangaDetail({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _ImageBackgroundWidget(color: color),
        Column(
          children: [
            const SizedBox(height: 50),
            const _InfomationMangaWidget(),
            btnSocialWidget(),
          ],
        ),
      ],
    );
  }

  Widget btnSocialWidget() {
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
  const _InfomationMangaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaDetailBloc, MangaDetailState>(
      buildWhen: (pre, cur) => pre.runtimeType != cur.runtimeType,
      builder: (context, state) {
        if (state is MangaDetailSuccessState) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: state.mangaDetail.thumbnailUrl,
                    httpHeaders: ENV.headersBuilder,
                    fit: BoxFit.cover,
                    height: SizeConfig.screenHeight / 5,
                    width: SizeConfig.screenWidth / 3.5,
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
                          state.mangaDetail.title,
                          style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        state.mangaDetail.author ?? '',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        state.mangaDetail.status!,
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.8),
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
        return const SizedBox.shrink();
      },
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
