import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../base/text.dart';
import '../../../../../config/constants/size.dart';
import '../../../domain/domain.dart';
import '../../detail/manga_detail_screen.dart';

class ItemManga extends StatelessWidget {
  const ItemManga({
    super.key,
    required this.title,
    required this.thumbnailUrl,
    required this.endpoint,
  });

  final String? title;
  final String? thumbnailUrl;
  final String? endpoint;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(context),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                placeholder: (BuildContext context, String url) {
                  return Center(
                    child: Container(
                      alignment: Alignment.center,
                      color: CupertinoDynamicColor.resolve(
                        CupertinoColors.systemGrey5.withOpacity(0.2),
                        context,
                      ),
                      child: const CupertinoActivityIndicator(),
                    ),
                  );
                },
                fit: BoxFit.cover,
                imageUrl: thumbnailUrl!,
              ),
            ),
          ),
          SizedBox(
            height: 35,
            child: Padding(
              padding: const EdgeInsets.all(5.0).copyWith(bottom: 0),
              child: IrohaText.regular(
                title!,
                fontSize: FontSizes.s11,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPress(BuildContext context) {
    final params = MangaDetail(
      idManga: '123456',
      thumbnailUrl: thumbnailUrl,
      endpoint: endpoint,
      title: title,
    );

    Navigator.of(context).pushNamed(
      MangaDetailScreen.routeName,
      arguments: MangaDetailScreen(mangaDetail: params),
    );
  }
}
