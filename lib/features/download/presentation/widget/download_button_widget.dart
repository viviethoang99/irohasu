import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../download.dart';

class DownloadButtonWidget extends StatelessWidget {
  const DownloadButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DownloadChapCubit>(
      create: (context) => getIt<DownloadChapCubit>(),
      child: BlocBuilder<DownloadChapCubit, DownloadChapState>(
        builder: (context, state) {
          if (state is DownloadChapInitial) {
            return Container();
          }
          return Container();
        },
      ),
    );
  }
}
