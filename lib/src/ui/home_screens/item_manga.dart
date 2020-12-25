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
        elevation: 0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  thumbnailUrl,
                  headers: BlogTruyen.headersBuilder,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
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
