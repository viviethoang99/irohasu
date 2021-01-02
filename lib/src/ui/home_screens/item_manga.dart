import 'package:flutter/material.dart';

import '../../../src/constants/base_blogtruyen.dart';
import '../../../src/ui/detail_screens/manga_detail_screen.dart';

class ItemManga extends StatelessWidget {
  ItemManga({
    @required this.title,
    @required this.thumbnailUrl,
    @required this.setUrlWithoutDomain,
  });

  final String title;
  final String thumbnailUrl;
  final String setUrlWithoutDomain;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(MangaDetailScreen.routeName,
            arguments: setUrlWithoutDomain);
      },
      child: Card(
        color: Colors.grey[900],
        elevation: 0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 0.7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    thumbnailUrl,
                    headers: BlogTruyen.headersBuilder,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace stackTrace) {
                      return Image.asset('assets/images/404.png');
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'OpenSans',
                      fontSize: 15),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
