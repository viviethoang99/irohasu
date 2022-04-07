part of 'search_screen_bloc.dart';

abstract class SearchScreenEvent extends Equatable {
  const SearchScreenEvent();

  @override
  List<Object?> get props => [];
}

class FetchDataSearchEvent extends SearchScreenEvent {
  const FetchDataSearchEvent({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}

class AdvancedSearchEvent extends SearchScreenEvent {
  const AdvancedSearchEvent({
    this.addGenres,
    this.removeGenres,
    this.author,
    this.query,
  });

  final String? author;
  final String? addGenres;
  final String? removeGenres;
  final String? query;

  @override
  List<Object?> get props => [author, addGenres, removeGenres, query];
}
