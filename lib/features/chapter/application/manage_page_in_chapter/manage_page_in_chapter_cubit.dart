import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'manage_page_in_chapter_state.dart';

@injectable
class ManagePagesCubit extends Cubit<ManagePagesState> {
  ManagePagesCubit(
    @factoryParam this.currentPage,
    @factoryParam this.totalPages,
  ) : super(ManagePagesState(
          currentPage: currentPage,
          totalPages: totalPages - 1,
        ));

  final int currentPage;
  final int totalPages;

  String get current => (state.currentPage + 1).twoDigits;

  String get total => (state.totalPages + 1).twoDigits;

  void changePage(num value) {
    emit(state.copyWith(currentPage: value.round()));
  }

  void prePage() {
    if (state.currentPage != 0) {
      changePage(state.currentPage - 1);
    }
  }

  void nextPage() {
    if (current != total) {
      changePage(state.currentPage + 1);
    }
  }
}

extension on int {
  String get twoDigits {
    return toString().padLeft(2, '0');
  }
}
