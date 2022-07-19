import 'package:equatable/equatable.dart';

import '../../../../../core/core.dart';

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
    required this.name,
    required this.type,
  });

  final String name;
  final ReadMode type;

  @override
  List<Object?> get props => [name, type];
}

class BackgroundReadingOption extends Equatable {
  const BackgroundReadingOption({
    required this.name,
    required this.type,
  });

  final String name;
  final BackgroundReading type;

  @override
  List<Object?> get props => [name, type];
}
