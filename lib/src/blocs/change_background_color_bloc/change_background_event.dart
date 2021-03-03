part of 'change_background_bloc.dart';

@immutable
abstract class ChangeBackgroundEvent {}

class GetBackgroundColor extends ChangeBackgroundEvent {}

class BackgroundWhite extends ChangeBackgroundEvent {}

class BackgroundBlack extends ChangeBackgroundEvent {}