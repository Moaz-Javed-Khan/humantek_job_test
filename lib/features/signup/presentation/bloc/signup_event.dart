part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {}

class SignupButtonPressed extends SignupEvent {
  final String email;
  final String password;

  SignupButtonPressed({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [];
}
