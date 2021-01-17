import 'package:flutter/material.dart';

import '../../../constants/base_blogtruyen.dart';
import '../../detail_screens/manga_detail_screen.dart';

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
        color: Theme.of(context).backgroundColor,
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
                  style: Theme.of(context).textTheme.bodyText1,
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
