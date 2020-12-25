import 'package:equatable/equatable.dart';

abstract class MangaDetailEvent extends Equatable {
  const MangaDetailEvent();
  @override
  List<Object> get props => [];
}

class FetchMangaDetailEvent extends MangaDetailEvent{
  final String endpoint;
  FetchMangaDetailEvent(this.endpoint);
}