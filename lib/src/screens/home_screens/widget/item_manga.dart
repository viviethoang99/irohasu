import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../env.dart';
import '../../../blocs/manga_detail_bloc/bloc.dart';
import '../../detail_screens/manga_detail_screen.dart';

class ItemManga extends StatelessWidget {
  ItemManga({
    required this.title,
    required this.thumbnailUrl,
    required this.setUrlWithoutDomain,
    this.status,
  });

  final String? title;
  final String? thumbnailUrl;
  final String? setUrlWithoutDomain;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(
          MangaDetailScreen.routeName,
          arguments: setUrlWithoutDomain,
        )
            .then((_) {
          context.read<MangaDetailBloc>().add(CacheMangaDetailEvent());
        });
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 0.7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: (status == 'library')
                      ? CachedNetworkImage(
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          fit: BoxFit.cover,
                          imageUrl: thumbnailUrl!,
                        )
                      : Image.network(
                          thumbnailUrl!,
                          headers: ENV.headersBuilder,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset('assets/images/404.png');
                          },
                        ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  title!,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
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
