part of 'login_bloc.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  final SigninResponseModel loginResponse;

  LoginSuccessState({
    required this.loginResponse,
  });
  @override
  List<Object> get props => [];
}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({required this.error});

  @override
  List<Object> get props => [error];
}
