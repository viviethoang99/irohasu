import 'package:equatable/equatable.dart';

import '../../../src/models/search_model.dart';

abstract class SearchState extends Equatable{
  @override
  List<Object> get props => [];
}

class InitialSearchState extends SearchState{}

class SearchLoadingState extends SearchState{}

class SearchLoadedState extends SearchState{
  SearchLoadedState({this.list});
  final List<SearchModel> list;

  @override
  List<Object> get props => [list];
}

class SearchFailureState extends SearchState{
  SearchFailureState({this.msg});
  final String msg;

  @override
  List<Object> get props => [msg];
}