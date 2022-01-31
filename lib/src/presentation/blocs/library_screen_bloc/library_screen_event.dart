part of 'library_screen_bloc.dart';

abstract class LibraryScreenEvent extends Equatable {
  const LibraryScreenEvent();

  @override
  List<Object> get props => [];
}

class FetchDataLibrary extends LibraryScreenEvent {}
