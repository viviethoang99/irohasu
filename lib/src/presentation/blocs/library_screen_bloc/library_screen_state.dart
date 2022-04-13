part of 'library_screen_bloc.dart';

abstract class LibraryScreenState extends Equatable {
  const LibraryScreenState();

  @override
  List<Object?> get props => [];
}

class LibraryLoadingScreen extends LibraryScreenState {
  const LibraryLoadingScreen();
}

class LibrarySuccessScreen extends LibraryScreenState {
  const LibrarySuccessScreen(this.listManga);

  final ListMangaDetail listManga;

  @override
  List<Object?> get props => [listManga];
}

class LibraryFailureScreen extends LibraryScreenState {
  const LibraryFailureScreen(this.error);

  final Failure error;

  @override
  List<Object?> get props => [error];
}
