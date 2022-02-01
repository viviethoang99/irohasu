part of 'change_background_bloc.dart';

class ChangeBackgroundState extends Equatable{
  const ChangeBackgroundState({this.color, this.name, this.selectOption});

  factory ChangeBackgroundState.white() {
    return const ChangeBackgroundState(
      color: Colors.white,
      name: 'Trắng',
      selectOption: 0,
    );
  }

  factory ChangeBackgroundState.black() {
    return const ChangeBackgroundState(
      color: Colors.black87,
      name: 'Đen',
      selectOption: 1,
    );
  }

  final String? name;
  final Color? color;
  final int? selectOption;

  @override
  List<Object?> get props => [];
}
