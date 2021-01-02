import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDataSearchEvent extends SearchEvent {
  FetchDataSearchEvent({this.query});
  final String query;

  @override
  List<Object> get props => [query];
}
