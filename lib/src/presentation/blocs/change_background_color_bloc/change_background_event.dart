part of 'change_background_bloc.dart';

abstract class ChangeBackgroundEvent extends Equatable {
  const ChangeBackgroundEvent();

  @override
  List<Object?> get props => [];
}

class GetBackgroundColor extends ChangeBackgroundEvent {}

class SetBackgroundReading extends ChangeBackgroundEvent {
  const SetBackgroundReading(this.type);

  final BackgroundReading type;

  @override
  List<Object?> get props => [type];
}
