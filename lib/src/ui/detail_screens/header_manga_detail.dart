import 'package:flutter/material.dart';

import '../../constants/base_blogtruyen.dart';

class HeaderMangaDetail extends StatefulWidget {
  final String title;
  final List author;
  final String status;
  final String like;
  final String dislike;
  final String thumbnailUrl;

  HeaderMangaDetail({
    this.title,
    this.author,
    this.status,
    this.thumbnailUrl,
    this.like,
    this.dislike,
  });

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
            return LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(
                Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
          },
          blendMode: BlendMode.dstIn,
          child: Container(
            width: double.infinity,
            height: (MediaQuery.of(context).size.height) / 3,
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              height: (MediaQuery.of(context).size.height) / 3,
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
                alignment: Alignment.bottomLeft,
                height: (MediaQuery.of(context).size.height) / 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(widget.title,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.author.join(","),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      widget.status,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.thumb_up,
                                color: Colors.green,
                              ),
                              onPressed: null),
                          Text(
                            widget.like,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.thumb_down,
                                color: Colors.red,
                              ),
                              onPressed: null),
                          Text(
                            widget.dislike,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
