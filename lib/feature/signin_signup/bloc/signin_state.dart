import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

 class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final String token;

  SignInSuccess({
    @required this.token,
  });
}

class SignInFailure extends SignInState {
  final String error;

  const SignInFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

class UserSignedInSuccess extends SignInState {
  final String userName;

  UserSignedInSuccess({@required this.userName});
}
