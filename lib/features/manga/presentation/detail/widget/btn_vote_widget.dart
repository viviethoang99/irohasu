import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manga.dart';

class BtnVoteWidget extends StatelessWidget {
  const BtnVoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaDetailBloc, MangaDetailState>(
      buildWhen: (pre, cur) => pre.runtimeType != cur.runtimeType,
      builder: (context, state) {
        if (state is MangaDetailSuccessState) {
          return Row(
            children: <Widget>[
              const IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    color: Colors.green,
                  ),
                  onPressed: null),
              Text(
                '${state.mangaDetail.like ?? 0}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const IconButton(
                  icon: Icon(
                    Icons.thumb_down,
                    color: Colors.red,
                  ),
                  onPressed: null),
              Text(
                '${state.mangaDetail.dislike ?? 0}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
