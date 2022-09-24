import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../env.dart';
import '../../../../shared/shared.dart';
import '../../detail/manga_detail_screen.dart';
import '../../detail/model/manga_detail_screen_params.dart';

class ItemManga extends StatelessWidget {
  const ItemManga({
    Key? key,
    required this.title,
    required this.thumbnailUrl,
    required this.endpoint,
    this.imageCache = false,
  }) : super(key: key);

  final String? title;
  final String? thumbnailUrl;
  final String? endpoint;
  final bool imageCache;

  @override
  Widget build(BuildContext context) {
    return IrohaButtonOpacity(
      onTap: () {
        Navigator.of(context).pushNamed(
          MangaDetailScreen.routeName,
          arguments: MangaDetailScreen(
            params: MangaDetailScreenParams(
              endpoint: endpoint!,
              urlImage: thumbnailUrl!,
              name: title!,
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: thumbnailUrl ?? '',
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: imageCache
                      ? CachedNetworkImage(
                          placeholder: (_, url) => Container(
                            color: Theme.of(context).backgroundColor,
                            child: const SizedBox.expand(),
                          ),
                          fit: BoxFit.cover,
                          imageUrl: thumbnailUrl!,
                        )
                      : Image.network(
                          thumbnailUrl!,
                          headers: ENV.headersBuilder,
                          fit: BoxFit.cover,
                          errorBuilder: (_, exception, stackTrace) {
                            return Image.asset('assets/images/404.png');
                          },
                        ),
                ),
              ),
            ),
            Container(
              color: Theme.of(context).canvasColor.withOpacity(0.05),
              height: 35,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(5.0).copyWith(bottom: 0),
                child: Text(
                  title!,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 11,
                  ),
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
