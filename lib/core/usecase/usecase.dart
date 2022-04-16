import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  FutureOr<Either<Failure, Type>> call({Params params});
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
