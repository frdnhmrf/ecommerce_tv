part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoaded extends LoginState {
  final AuthResponseModel model;
  LoginLoaded({
    required this.model,
  });
}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {}
