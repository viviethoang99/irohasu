import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';


class ThemeOption extends Equatable {
  const ThemeOption({
    required this.name,
    required this.type,
  });

  final String name;
  final ThemeApp type;

  @override
  List<Object?> get props => [name, type];
}

class ReadingOption extends Equatable {
  const ReadingOption({
    this.name,
    this.index,
  });

  final String? name;
  final String? index;

  @override
  List<Object?> get props => [name, index];
}
