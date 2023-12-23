import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:humantek_test/features/forgetPassword/Data/repositories/forget_password_repository_imple.dart';
import 'package:humantek_test/features/login/Domain/model/signin_response_model.dart';

part 'forget_password_event.dart';

part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordRepositoryImple forgetPasswordRepo;

  ForgetPasswordBloc({required this.forgetPasswordRepo})
      : super(ForgetPasswordInitialState()) {
    on<ForgetPasswordButtonPressed>((event, emit) async {
      emit(ForgetPasswordLoadingState());

      try {
        var forgetPasswordResponse = await forgetPasswordRepo.forgetPassword(
          email: event.email,
        );

        emit(
          ForgetPasswordSuccessState(
            forgetPasswordResponse: SigninResponseModel.fromJson(
              jsonDecode(forgetPasswordResponse),
            ),
          ),
        );
      } catch (e) {
        // emit(ForgetPasswordFailureState(error: "Failed to ForgetPassword"));
        emit(ForgetPasswordFailureState(error: e.toString()));
      }
    });

    @override
    void onTransition(
        Transition<ForgetPasswordEvent, ForgetPasswordState> transition) {
      super.onTransition(transition);
      debugPrint(transition.toString());
    }

    @override
    void onChange(Change<ForgetPasswordState> change) {
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
    void onEvent(ForgetPasswordEvent event) {
      super.onEvent(event);
      debugPrint(event.toString());
    }
  }
}
