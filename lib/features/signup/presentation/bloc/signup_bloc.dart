import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:humantek_test/features/login/Domain/model/signin_response_model.dart';
import 'package:humantek_test/features/signup/Domain/repositories/signup_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupRepository signupRepo;

  SignupBloc({
    required this.signupRepo,
  }) : super(SignupInitialState()) {
    on<SignupButtonPressed>((event, emit) async {
      emit(SignupLoadingState());

      try {
        var signupResponse = await signupRepo.userSignup(
          email: event.email,
          password: event.password,
        );

        emit(
          SignupSuccessState(
            signinResponse: SigninResponseModel.fromJson(
              jsonDecode(signupResponse),
            ),
          ),
        );
      } catch (e) {
        // emit(LoginFailureState(error: "Failed to Signup"));
        emit(SignupFailureState(error: e.toString()));
      }
    });
  }

  @override
  void onTransition(Transition<SignupEvent, SignupState> transition) {
    super.onTransition(transition);
    debugPrint(transition.toString());
  }

  @override
  void onChange(Change<SignupState> change) {
    super.onChange(change);
    debugPrint(change.toString());
    debugPrint(change.currentState.toString());
    debugPrint(change.nextState.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint(error.toString());
  }

  @override
  void onEvent(SignupEvent event) {
    super.onEvent(event);
    debugPrint(event.toString());
  }
}
