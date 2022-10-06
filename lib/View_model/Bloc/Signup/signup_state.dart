part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class ChangeState extends SignupState {}

class EmailState extends SignupState {}

class PasswordState extends SignupState {}

class rePasswordState extends SignupState {}

class nameState extends SignupState {}

class phoneState extends SignupState {}

class ObsecurerePasswordState extends SignupState {}

class ObsecurePasswordState extends SignupState {}

class GenderChange extends SignupState {}

class UniversityChange extends SignupState {}

class GradeChange extends SignupState {}

class LoginSuccess extends SignupState {}

class LoginError extends SignupState {}

class UniversityData extends SignupState {}





