import 'dart:developer';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'forget_password_event.dart';

part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgotPasswordButtonPressed>((event, emit) async {
      emit(SendingCode());
      try {
        final res = await Amplify.Auth.resetPassword(username: event.email);
        if (res.nextStep.updateStep == "CONFIRM_RESET_PASSWORD_WITH_CODE") {
          log("reset password response ==> ${res.nextStep.updateStep}");
          emit(CodeSentSuccessful());
        }
      } catch (ex, stack) {
        debugPrintStack(label: ex.toString(), stackTrace: stack);
        emit(FailedToSendCode());
      }
    });

    on<ChangePasswordButtonPressed>((event, emit) async {
      try {
        final res = await Amplify.Auth.confirmResetPassword(
            username: event.email,
            newPassword: event.newPassword,
            confirmationCode: event.code);
        log("confirm reset password response ==> ${res}");
        emit(PasswordChanged());
      } catch (error) {
        emit(FailedToChangePassword(error: error.toString()));
      }
    });
  }
}
