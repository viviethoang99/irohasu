import 'package:equatable/equatable.dart';

class ThemeModel extends Equatable {
  ThemeModel({this.name, this.index});

  final String name;
  final int index;

  @override
  List<Object> get props => [name, index];
}

class ReadingMode extends Equatable {
  ReadingMode({this.name, this.index});

  final String name;
  final String index;

  @override
  List<Object> get props => [name, index];
}