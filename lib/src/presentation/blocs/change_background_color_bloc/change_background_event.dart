part of 'change_background_bloc.dart';

abstract class ChangeBackgroundEvent {}

class GetBackgroundColor extends ChangeBackgroundEvent {}

class SetBackgroundWhite extends ChangeBackgroundEvent {}

class SetBackgroundBlack extends ChangeBackgroundEvent {}