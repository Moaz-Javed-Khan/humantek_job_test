import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:humantek_test/features/login/Data/repositories/login_repository_imple.dart';
import 'package:humantek_test/features/login/Domain/model/signin_response_model.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepositoryImple loginRepo;

  LoginBloc({required this.loginRepo}) : super(LoginInitialState()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoadingState());

      try {
        var loginResponse = await loginRepo.userlogin(
          email: event.email,
          password: event.password,
        );

        emit(
          LoginSuccessState(
            loginResponse: SigninResponseModel.fromJson(
              jsonDecode(loginResponse),
            ),
          ),
        );
      } catch (e) {
        // emit(LoginFailureState(error: "Failed to Login"));
        emit(LoginFailureState(error: e.toString()));
      }
    });

    @override
    void onTransition(Transition<LoginEvent, LoginState> transition) {
      super.onTransition(transition);
      debugPrint(transition.toString());
    }

    @override
    void onChange(Change<LoginState> change) {
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
    void onEvent(LoginEvent event) {
      super.onEvent(event);
      debugPrint(event.toString());
    }
  }
}
