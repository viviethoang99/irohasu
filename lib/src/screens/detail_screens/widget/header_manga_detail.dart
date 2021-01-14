import 'dart:math';

import 'package:flutter/material.dart';
import 'package:irohasu/src/components/webview_widget.dart';
import 'package:irohasu/src/constants/base_colors.dart';

import '../../../../src/helper/media_query_helper.dart';
import '../../../../src/models/manga_detail_model.dart';
import '../../../constants/base_blogtruyen.dart';
import './btn_vote_widget.dart';

class HeaderMangaDetail extends StatefulWidget {
  HeaderMangaDetail({this.data});

  final MangaDetail data;

  @override
  _HeaderMangaDetailState createState() => _HeaderMangaDetailState();
}

class _HeaderMangaDetailState extends State<HeaderMangaDetail> {
  String get author => widget.data.author ?? '';

  String get thumbnailUrl => widget.data.thumb;

  String get title => widget.data.title;

  String get status => widget.data.status;

  String get like => widget.data.like;

  String get dislike => widget.data.dislike;

  bool dataAuthor = false;

  String urlPage;
  Random random = Random();
  int indexColor;

  @override
  void initState() {
    super.initState();
    dataAuthor = author.isNotEmpty ? true : false;
    indexColor = random.nextInt(22);
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
                Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
          },
          blendMode: BlendMode.dstIn,
          child: Container(
            width: double.infinity,
            height: ScreenHelper.getHeight(context) / 2.5,
            decoration: BoxDecoration(
              color: AppColors.listColorsApp[indexColor],
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.35), BlendMode.dstATop),
                image: NetworkImage(thumbnailUrl,
                    headers: BlogTruyen.headersBuilder),
              ),
            ),
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
                    child: Image.network(
                      thumbnailUrl,
                      headers: BlogTruyen.headersBuilder,
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
                            title,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        if (dataAuthor)
                          Text(
                            author,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          status,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                        BtnVoteWidget(
                          countLike: like,
                          countDislike: dislike,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            btnSocialWidget(),
          ],
        ),
      ],
    );
  }

  Widget btnSocialWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 10),
      child: Row(
        children: <Widget>[
          const IconButton(
            icon: Icon(
              Icons.cloud,
              color: Colors.green,
              size: 38,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: const Icon(
              Icons.language,
              color: Colors.green,
              size: 38,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(WebViewPage.routeName,
                  arguments: WebViewPage(
                      title: widget.data.title, url: widget.data.endpoint));
            },
          ),
          const IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.green,
              size: 38,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
