part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [];

  // @override
  // String toString() => 'LoginButtonPressed { inout: $input }';
}
