part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordButtonPressed extends ForgetPasswordEvent {
  final String email;

  ForgotPasswordButtonPressed({@required this.email});
}

class ChangePasswordButtonPressed extends ForgetPasswordEvent {
  final String code;
  final String newPassword;
  final String email;

  ChangePasswordButtonPressed(
      {@required this.code, @required this.newPassword, @required this.email});
}
