part of 'search_advanced_cubit.dart';

class SearchAdvancedState extends Equatable {
  const SearchAdvancedState({
    this.author = '',
    this.addGenres = const [],
    this.deleteGenres = const [],
  });

  final String author;
  final List<int> addGenres;
  final List<int> deleteGenres;

  SearchAdvancedState copyWith({
    String? author,
    List<int>? addGenres,
    List<int>? deleteGenres,
  }) {
    return SearchAdvancedState(
      author: author ?? this.author,
      addGenres: addGenres ?? this.addGenres,
      deleteGenres: deleteGenres ?? this.deleteGenres,
    );
  }

  @override
  List<Object> get props => [author, addGenres, deleteGenres];
}
