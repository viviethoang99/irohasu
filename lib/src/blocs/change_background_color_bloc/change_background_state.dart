part of 'change_background_bloc.dart';

@immutable
abstract class ChangeBackgroundState {}

class ChangeBackground extends ChangeBackgroundState {
  ChangeBackground(this.color, this.string);

  factory ChangeBackground.white() {
    return ChangeBackground(Colors.white, 'Trắng');
  }

  factory ChangeBackground.black() {
    return ChangeBackground(Colors.black87, 'Đen');
  }

  final String string;
  final Color color;
}
