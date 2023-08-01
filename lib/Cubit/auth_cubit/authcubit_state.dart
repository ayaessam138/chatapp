part of 'authcubit_cubit.dart';

@immutable
abstract class AuthcubitState {}

class AuthcubitInitial extends AuthcubitState {}

class Loginloading extends AuthcubitState {}

class LoginIsucess extends AuthcubitState {}

class Loginfail extends AuthcubitState {
  String? errormessage;
  Loginfail({required this.errormessage});
}

class Signuploading extends AuthcubitState {}

class SignupIsucess extends AuthcubitState {}

class Signupfail extends AuthcubitState {
  String? errormessage;
  Signupfail({required this.errormessage});
}
