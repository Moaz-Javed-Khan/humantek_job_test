part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState extends Equatable {}

class ForgetPasswordInitialState extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}

class ForgetPasswordLoadingState extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}

class ForgetPasswordSuccessState extends ForgetPasswordState {
  final SigninResponseModel forgetPasswordResponse;

  ForgetPasswordSuccessState({
    required this.forgetPasswordResponse,
  });
  @override
  List<Object> get props => [];
}

class ForgetPasswordFailureState extends ForgetPasswordState {
  final String error;

  ForgetPasswordFailureState({required this.error});

  @override
  List<Object> get props => [error];
}
