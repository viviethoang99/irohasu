import 'package:flutter/material.dart';

import '../../../constants/base_blogtruyen.dart';
import 'btn_social_widget.dart';
import 'btn_vote_widget.dart';

class HeaderMangaDetail extends StatefulWidget {
  HeaderMangaDetail({
    this.title,
    this.author,
    this.status,
    this.thumbnailUrl,
    this.like,
    this.dislike,
  });

  final String title;
  final List author;
  final String status;
  final String like;
  final String dislike;
  final String thumbnailUrl;

  @override
  _HeaderMangaDetailState createState() => _HeaderMangaDetailState();
}

class _HeaderMangaDetailState extends State<HeaderMangaDetail> {
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
            height: (MediaQuery.of(context).size.height) / 2.5,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.35), BlendMode.dstATop),
                image: NetworkImage(widget.thumbnailUrl,
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
                      widget.thumbnailUrl,
                      headers: BlogTruyen.headersBuilder,
                      fit: BoxFit.cover,
                      height: (MediaQuery.of(context).size.height) / 5,
                      width: (MediaQuery.of(context).size.width) / 3.5,
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
                            widget.title,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        widget.author != null
                            ? Text(
                                widget.author.join(','),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              )
                            : Container(),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.status,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                        BtnVoteWidget(
                          countLike: widget.like,
                          countDislike: widget.dislike,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const BtnSocialWidget(),
          ],
        ),
      ],
    );
  }
}
