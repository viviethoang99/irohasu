import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/type/genres_status.dart';

part 'search_advanced_state.dart';

class SearchAdvancedCubit extends Cubit<SearchAdvancedState> {
  SearchAdvancedCubit() : super(const SearchAdvancedState());

  void authorChange(String value) {
    emit(state.copyWith(author: value));
  }

  void addToDeleteList(int id) {
    final newListAddGenres =
        state.addGenres.where((idGenres) => idGenres != id).toList();
    emit(state.copyWith(
      addGenres: newListAddGenres,
      deleteGenres: [...state.deleteGenres, id],
    ));
  }

  void onTapGenres(GenresStatus type, int id) {
    switch (type) {
      case GenresStatus.select:
        addToDeleteList(id);
        break;
      case GenresStatus.remove:
        removeToDeleteList(id);
        break;
      default:
        addToAddGenres(id);
        break;
    }
  }

  void addToAddGenres(int id) {
    emit(state.copyWith(addGenres: [...state.addGenres, id]));
  }

  void removeToDeleteList(int id) {
    final newListDeleteGenres =
        state.deleteGenres.where((idGenres) => idGenres != id).toList();
    emit(state.copyWith(
      deleteGenres: newListDeleteGenres,
    ));
  }

  GenresStatus getStatusGenres(int id) {
    if (state.addGenres.contains(id)) {
      return GenresStatus.select;
    } else if (state.deleteGenres.contains(id)) {
      return GenresStatus.remove;
    } else {
      return GenresStatus.none;
    }
  }

  void clear() {
    emit(const SearchAdvancedState());
  }
}
