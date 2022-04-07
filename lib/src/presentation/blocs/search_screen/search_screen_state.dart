part of 'search_screen_bloc.dart';

abstract class SearchScreenState extends Equatable {
  const SearchScreenState();

  @override
  List<Object?> get props => [];
}

class SearchScreenInitial extends SearchScreenState {}

class SearchScreenLoadingState extends SearchScreenState {}

class SearchScreenLoadedState extends SearchScreenState {
  const SearchScreenLoadedState({required this.list});

  final List<MangaModel> list;

  @override
  List<Object> get props => [list];
}

class SearchScreenFailureState extends SearchScreenState {
  const SearchScreenFailureState({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}
