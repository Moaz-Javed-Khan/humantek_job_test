part of 'forget_password_bloc.dart';

@immutable
abstract class ForgetPasswordEvent extends Equatable {}

class ForgetPasswordButtonPressed extends ForgetPasswordEvent {
  final String email;

  ForgetPasswordButtonPressed({
    required this.email,
  });

  @override
  List<Object> get props => [];
}
