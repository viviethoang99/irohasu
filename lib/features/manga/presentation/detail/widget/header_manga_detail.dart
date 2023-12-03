import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/item_not_found.dart';
import '../../../../../base/spacing.dart';
import '../../../../../base/text.dart';
import '../../../../../config/constants/size.dart';
import '../../../../../core/core.dart';
import '../../../../../env.dart';
import '../../../manga.dart';
import 'btn_vote_widget.dart';

class HeaderMangaDetail extends StatelessWidget {
  const HeaderMangaDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _InfomationMangaWidget(),
        _ListButtonWidget(),
      ],
    );
  }
}

class _InfomationMangaWidget extends StatelessWidget {
  const _InfomationMangaWidget();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MangaDetailBloc, MangaDetailState, MangaDetail?>(
      selector: (state) => state.mangaDetail,
      builder: (context, mangaDetail) {
        if (mangaDetail != null) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: mangaDetail.thumbnailUrl,
                    httpHeaders: ENV.headersBuilder,
                    fit: BoxFit.cover,
                    height: SizeConfig.screenHeight / 5,
                    width: SizeConfig.screenWidth / 3.5,
                  ),
                ),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: IrohaText.medium(
                          mangaDetail.title,
                          fontSize: FontSizes.s18,
                        ),
                      ),
                      IrohaText.regular(
                        mangaDetail.author ?? '',
                        fontSize: 14,
                      ),
                      const VSpace(5),
                      IrohaText.regular(
                        mangaDetail.status ?? '',
                        fontSize: FontSizes.s14,
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                      ),
                      const BtnVoteWidget()
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return const ItemNotFound();
      },
    );
  }
}

class _ListButtonWidget extends StatelessWidget {
  const _ListButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: <Widget>[
          BlocSelector<MangaDetailBloc, MangaDetailState, bool>(
            selector: (state) => state.isFavoriteManga,
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).canvasColor,
                  size: 30,
                ),
                onPressed: () => context
                    .read<MangaDetailBloc>()
                    .add(const SetStatusFavoriteManga()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.language,
              color: Theme.of(context).canvasColor,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.share,
              color: Theme.of(context).canvasColor,
              size: 30,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
