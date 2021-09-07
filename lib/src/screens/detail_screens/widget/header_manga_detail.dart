import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../env.dart';
import '../../../config/base_colors.dart';
import '../../../helper/media_query_helper.dart';
import '../../../local/favorite_data.dart';
import '../../../models/manga_detail_model.dart';
import '../../../widgets/webview_widget.dart';
import 'btn_vote_widget.dart';

class HeaderMangaDetail extends StatefulWidget {
  HeaderMangaDetail({this.data});

  final MangaDetailModel? data;

  @override
  _HeaderMangaDetailState createState() => _HeaderMangaDetailState();
}

class _HeaderMangaDetailState extends State<HeaderMangaDetail> {
  String get author => widget.data!.author ?? '';

  String? get _idManga => widget.data!.idManga;

  bool dataAuthor = false;
  String? urlPage;
  Random random = Random();
  late int indexColor;
  bool _isFavorite = false, status = false;

  final mangaBox = Hive.box<dynamic>('irohasu');

  @override
  void initState() {
    super.initState();
    dataAuthor = author.isNotEmpty ? true : false;
    indexColor = random.nextInt(AppColors.listColorsApp.length);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ShaderMask(
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
            imageUrl: widget.data!.thumbnailUrl!,
            imageBuilder: (context, imageProvider) => Container(
              width: ScreenHelper.getWidth(context),
              height: ScreenHelper.getHeight(context) / 2.5,
              decoration: BoxDecoration(
                color: AppColors.listColorsApp[indexColor],
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitWidth,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.35), BlendMode.dstATop),
                ),
              ),
            ),
            httpHeaders: ENV.headersBuilder,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, dynamic error) =>
                const Icon(Icons.error),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 100),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: widget.data!.thumbnailUrl!,
                      httpHeaders: ENV.headersBuilder,
                      fit: BoxFit.cover,
                      height: ScreenHelper.getHeight(context) / 5,
                      width: ScreenHelper.getWidth(context) / 3.5,
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: Text(
                            widget.data!.title!,
                            style: TextStyle(
                                fontSize: 22,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        if (dataAuthor)
                          Text(author,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor)),
                        const SizedBox(height: 15),
                        Text(widget.data!.status!,
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).primaryColor)),
                        BtnVoteWidget(data: widget.data)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            btnSocialWidget(context),
          ],
        ),
      ],
    );
  }

  Widget btnSocialWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 10),
      child: ValueListenableBuilder(
          valueListenable: mangaBox.listenable(keys: ['listManga']),
          builder: (context, Box _box, _) {
            var listManga = _box.get('listManga', defaultValue: {});

            _isFavorite = listManga[_idManga]?.data?.isFavorite ?? false;
            return Row(
              children: <Widget>[
                _isFavorite
                    ? IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).buttonColor,
                          size: 38,
                        ),
                        onPressed: () => FavoriteData.isFavorite(_idManga))
                    : IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Theme.of(context).primaryColor,
                          size: 38,
                        ),
                        onPressed: () => FavoriteData.isFavorite(_idManga)),
                IconButton(
                  icon: Icon(
                    Icons.language,
                    color: Theme.of(context).primaryColor,
                    size: 38,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(WebViewPage.routeName,
                        arguments: WebViewPage(
                            title: widget.data!.title,
                            url: ENV.urlWebView(widget.data!.endpoint!)));
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
          }),
    );
  }
}
