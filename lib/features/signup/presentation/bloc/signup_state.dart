part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitialState extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {
  final SigninResponseModel signinResponse;

  const SignupSuccessState({required this.signinResponse});
  @override
  List<Object> get props => [signinResponse];
}

final class SignupFailureState extends SignupState {
  final String error;

  const SignupFailureState({required this.error});
  @override
  List<Object> get props => [error];
}
