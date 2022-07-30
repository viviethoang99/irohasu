import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../github/github.dart';
import '../../chapter.dart';

part 'manage_download_event.dart';
part 'manage_download_state.dart';

@injectable
class ManageDownloadBloc
    extends Bloc<ManageDownloadEvent, ManageDownloadState> {
  ManageDownloadBloc(
    this._fetchDataChapterUsecase,
    this._downloadChapUsecase,
    this._getDownloadPathUseCase,
  ) : super(ManageDownloadInitial()) {
    on<AddChapterEvent>(_addChapter);
  }

  final FetchDataChapterUsecase _fetchDataChapterUsecase;
  final DownloadChapUsecase _downloadChapUsecase;
  final GetDownloadPathUseCase _getDownloadPathUseCase;

  Future<void> _addChapter(
    AddChapterEvent event,
    Emitter<ManageDownloadState> emit,
  ) async {
    final manga = await _fetchDataChapterUsecase.call(params: event.endpoint);
    await manga.fold((l) => null, (chap) async {
      final path = await _getDownloadPathUseCase.call();
      await path.fold(
        (l) => null,
        (r) async {
          final params = DownloadChapParams(
            idManga: chap.mangaEndpoint!.toId(1),
            title: chap.title,
            idChapter: chap.id.toId(0),
            listImage: chap.listImage!,
            path: r,
          );
          await _downloadChapUsecase.call(params: params);
        },
      );
    });
  }
}

extension on String? {
  String toId(int index) => this?.split('/')[index] ?? 'valid';
}
