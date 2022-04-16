part of 'library_screen_bloc.dart';

abstract class LibraryScreenEvent extends Equatable {
  const LibraryScreenEvent();

  @override
  List<Object> get props => [];
}

class FetchDataLibrary extends LibraryScreenEvent {
  const FetchDataLibrary(this.listId);

  final List<String> listId;

  @override
  List<Object> get props => [listId];
}

class WatchDataLibrary extends LibraryScreenEvent {
  const WatchDataLibrary(this.listId);

  final List<String> listId;

  @override
  List<Object> get props => [listId];
}
