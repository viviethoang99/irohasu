import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../env.dart';
import '../../../blocs/manga_detail_bloc/bloc.dart';
import '../../../config/base_colors.dart';
import '../../../helper/size_config.dart';
import 'btn_vote_widget.dart';

class HeaderMangaDetail extends StatelessWidget {
  const HeaderMangaDetail();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const _ImageBackgroundWidget(),
        Column(
          children: [
            const SizedBox(height: 100),
            const _InfomationMangaWidget(),
            btnSocialWidget(),
          ],
        ),
      ],
    );
  }

  Widget btnSocialWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 10),
      child: BlocBuilder<MangaDetailBloc, MangaDetailState>(
        builder: (context, state) {
          if (state is MangaDetailSuccessState) {
            return Row(
              children: <Widget>[
                state.mangaDetail.isFavorite
                    ? IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).buttonColor,
                          size: 38,
                        ),
                        onPressed: () => context
                            .read<MangaDetailBloc>()
                            .add(FavoriteMangaEvent()),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Theme.of(context).primaryColor,
                          size: 38,
                        ),
                        onPressed: () => context
                            .read<MangaDetailBloc>()
                            .add(FavoriteMangaEvent()),
                      ),
                IconButton(
                  icon: Icon(
                    Icons.language,
                    color: Theme.of(context).primaryColor,
                    size: 38,
                  ),
                  onPressed: () {
                    // Navigator.of(context).pushNamed(
                    //   WebViewPage.routeName,
                    //   arguments: WebViewPage(
                    //     title: state.mangaDetail.title,
                    //     url: ENV.urlWebView(state.mangaDetail.endpoint),
                    //   ),
                    // );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Theme.of(context).primaryColor,
                    size: 38,
                  ),
                  onPressed: null,
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
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
                            fontSize: 22,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        state.mangaDetail.author ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        state.mangaDetail.status!,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
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

class _ImageBackgroundWidget extends StatefulWidget {
  const _ImageBackgroundWidget({Key? key}) : super(key: key);

  @override
  __ImageBackgroundWidgetState createState() => __ImageBackgroundWidgetState();
}

class __ImageBackgroundWidgetState extends State<_ImageBackgroundWidget> {
  late final int indexColor;
  late final Random random;

  @override
  void initState() {
    random = Random();
    indexColor = random.nextInt(AppColors.listColorsApp.length);
    super.initState();
  }

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
                  color: AppColors.listColorsApp[indexColor],
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
