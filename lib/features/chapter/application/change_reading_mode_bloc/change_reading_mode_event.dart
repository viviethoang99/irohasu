part of 'change_reading_mode_bloc.dart';

abstract class ChangeReadingModeEvent extends Equatable {
  const ChangeReadingModeEvent();

  @override
  List<Object?> get props => [];
}

class UpdateReadingMode extends ChangeReadingModeEvent {
  const UpdateReadingMode(this.type);

  final ReadMode type;

  @override
  List<Object?> get props => [type];
}

class GetReadingMode extends ChangeReadingModeEvent {}
