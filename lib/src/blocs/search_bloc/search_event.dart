import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDataSearchEvent extends SearchEvent {
  FetchDataSearchEvent({@required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}

class AdvancedSearchEvent extends SearchEvent {
  AdvancedSearchEvent({
    this.addGenres,
    this.removeGenres,
    this.author,
    this.query,
  });
  @override
  List<Object> get props => [author, addGenres, removeGenres, query];

  final String author;
  final String addGenres;
  final String removeGenres;
  final String query;
}
