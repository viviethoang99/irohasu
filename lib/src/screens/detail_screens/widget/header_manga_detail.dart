import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../env.dart';
import '../../../blocs/manga_detail_bloc/bloc.dart';
import '../../../config/base_colors.dart';
import '../../../helper/media_query_helper.dart';
import '../../../local/favorite_data.dart';
import '../../../widgets/webview_widget.dart';
import 'btn_vote_widget.dart';

class HeaderMangaDetail extends StatefulWidget {
  const HeaderMangaDetail();

  @override
  _HeaderMangaDetailState createState() => _HeaderMangaDetailState();
}

class _HeaderMangaDetailState extends State<HeaderMangaDetail> {
  late final Box mangaBox;

  @override
  void initState() {
    mangaBox = Hive.box<dynamic>('irohasu');
    super.initState();
  }

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
          if (state is MangaDetailLoadedState) {
            final idManga = state.data!.idManga;
            return ValueListenableBuilder(
                valueListenable: mangaBox.listenable(keys: ['listManga']),
                builder: (_, Box _box, child) {
                  var listManga = _box.get('listManga', defaultValue: {});
                  return Row(
                    children: <Widget>[
                      listManga[idManga]?.chapter?.isFavorite ?? false
                          ? IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Theme.of(context).buttonColor,
                                size: 38,
                              ),
                              onPressed: () => FavoriteData.isFavorite(idManga))
                          : IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Theme.of(context).primaryColor,
                                size: 38,
                              ),
                              onPressed: () => FavoriteData.isFavorite(idManga),
                            ),
                      IconButton(
                        icon: Icon(
                          Icons.language,
                          color: Theme.of(context).primaryColor,
                          size: 38,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            WebViewPage.routeName,
                            arguments: WebViewPage(
                              title: state.data!.title,
                              url: ENV.urlWebView(state.data!.endpoint),
                            ),
                          );
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
                });
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
        if (state is MangaDetailLoadedState) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: state.data!.thumbnailUrl,
                    httpHeaders: ENV.headersBuilder,
                    fit: BoxFit.cover,
                    height: ScreenHelper.getHeight(context) / 5,
                    width: ScreenHelper.getWidth(context) / 3.5,
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
                          state.data!.title,
                          style: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        state.data?.author ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        state.data!.status!,
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
          if (state is MangaDetailLoadedState) {
            return CachedNetworkImage(
              imageUrl: state.data?.thumbnailUrl ?? '',
              imageBuilder: (context, imageProvider) => Container(
                width: ScreenHelper.getWidth(context),
                height: ScreenHelper.getHeight(context) / 2.5,
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
              errorWidget: (context, url, dynamic error) =>
                  const Icon(Icons.error),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
