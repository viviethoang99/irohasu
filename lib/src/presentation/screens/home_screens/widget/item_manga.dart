import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../env.dart';
import '../../detail_screens/manga_detail_screen.dart';

class ItemManga extends StatelessWidget {
  const ItemManga({
    Key? key,
    required this.title,
    required this.thumbnailUrl,
    required this.endpoint,
    this.status,
  }) : super(key: key);

  final String? title;
  final String? thumbnailUrl;
  final String? endpoint;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          MangaDetailScreen.routeName,
          arguments: MangaDetailScreen(endpoint: endpoint!),
        );
      },
      child: Card(
        elevation: 2,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: (status == 'library')
                    ? CachedNetworkImage(
                        placeholder: (_, url) =>
                            const CircularProgressIndicator(),
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
