import 'dart:developer';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:slaughterandrancher/feature/signin_signup/bloc/index.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<SignInButtonPressed>((event, emit) async {
      emit(SignInLoading());
      try {
        final response = await Amplify.Auth.signIn(
          username: event.username,
          password: event.password,
        );

        if (response.isSignedIn) {
          final result = await Amplify.Auth.fetchAuthSession();
          final user = await Amplify.Auth.getCurrentUser();
          log("token ==> ${user.userId}  \n userName ==> ${user.username} \n result ==> ${result.isSignedIn} ");
          // log(" response ===> ${Amplify.Auth.fetchAuthSession(options: CognitoSessionOptions(getAWSCredentials: true))}");
          emit(SignInSuccess(
            token: user.userId,
          ));
        }
      } catch (error) {
        emit(SignInFailure(error: error.toString()));
      }
    });

    on<UserSignedIn>((event, emit) async {
      emit(SignInLoading());
      try {
        final result = await Amplify.Auth.fetchAuthSession();
        final user = await Amplify.Auth.getCurrentUser();
        log("token ==> ${user.userId}  \n userName ==> ${user.username} \n result ==> ${result.isSignedIn} ");
        emit(UserSignedInSuccess(userName: user.username));
      } catch (ex, stack) {
        debugPrintStack(label: ex.toString(), stackTrace: stack);
      }
    });
  }

// final AuthRepository authRepository;
// final AuthenticationBloc authenticationBloc;

// SignInBloc({
//   @required this.authRepository,
//   @required this.authenticationBloc,
// })  : assert(authRepository != null),
//       assert(authenticationBloc != null),
//       super(SignInInitial());

// @override
// Stream<SignInState> mapEventToState(SignInEvent event) async* {
//   if (event is SignInButtonPressed) {
//     yield SignInLoading();
//
//     try {
//       // final response =
//       //     await authRepository.signIn(event.username, event.password);
//
//       // if (response.status == Status.ConnectivityError) {
//       //   //Internet problem
//       //   yield const SignInFailure(error: "");
//       // }
//       // if (response.status == Status.Success) {

//       // } else {
//       //   yield SignInFailure(error: response.message);
//       final response = await Amplify.Auth.signIn(
//         username: event.username,
//         password: event.password,
//       );
//       if(response.isSignedIn){
//         yield SignInSuccess();
//       }
//     } catch (error) {
//       yield SignInFailure(error: error.toString());
//     }
//   }
// }
}
