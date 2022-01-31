import 'package:equatable/equatable.dart';
import '../../../data/model/manga_list_model.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialSearchState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  SearchLoadedState({required this.list});

  final List<MangaModel> list;

  @override
  List<Object> get props => [list];
}

class SearchFailureState extends SearchState {
  SearchFailureState({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}