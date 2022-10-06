part of 'nav_cubit.dart';

@immutable
abstract class NavState {}

class NavInitial extends NavState {}

class ChangeScreen extends NavState {}
