part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class EmailChangeState extends LoginState {}

class PasswordChangeState extends LoginState {}

class ObsecureChangeState extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {}

class loatState extends LoginState {}





