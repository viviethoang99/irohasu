part of 'manage_page_in_chapter_cubit.dart';

class ManagePagesState extends Equatable {
  const ManagePagesState({
    this.currentPage = 0,
    this.totalPages = 1,
  });

  final int currentPage;
  final int totalPages;

  ManagePagesState copyWith({
    int? currentPage,
    int? totalPages,
  }) {
    return ManagePagesState(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object> get props => [currentPage, totalPages];
}
