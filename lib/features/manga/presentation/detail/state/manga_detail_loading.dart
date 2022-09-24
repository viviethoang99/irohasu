import 'package:flutter/material.dart';

import '../../../../shared/presentation/iroha_widget/custom_shimmer/iroha_shimmer.dart';
import '../model/manga_detail_screen_params.dart';
import '../widget/header_manga_detail.dart';

class MangaDetailLoading extends StatelessWidget {
  const MangaDetailLoading({
    super.key,
    required this.params,
  });

  final MangaDetailScreenParams params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const HeaderMangaDetail(),
          Expanded(
            child: IrohaShimmer(
              child: Container(
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
