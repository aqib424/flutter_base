part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class CodeSentSuccessful extends ForgetPasswordState {}

class FailedToSendCode extends ForgetPasswordState {}

class SendingCode extends ForgetPasswordState {}

class PasswordChanged extends ForgetPasswordState {}

class FailedToChangePassword extends ForgetPasswordState {
  final String error;

  FailedToChangePassword({@required this.error});
}

class ChangingPassword extends ForgetPasswordState {}
