part of 'history_bloc.dart';

@immutable
abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object?> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  HistoryLoaded({this.data});

  final List? data;

  @override
  List<Object?> get props => [data];
}

class HistoryFailed extends HistoryState {}