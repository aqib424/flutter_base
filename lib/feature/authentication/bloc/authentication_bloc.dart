import 'dart:developer';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:slaughterandrancher/feature/authentication/resource/user_repository.dart';
import 'package:meta/meta.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(AuthenticationUninitialized()) {
    on<AuthStarted>((event, emit) async {
      log("message");
      final bool hasToken = await userRepository.hasToken();
      // final response = await Amplify.Auth.fetchAuthSession();
      // if(response.isSignedIn){
      //   log("user is already Logged In");}
      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });

    on<LoggedIn>((event, emit) async {
      emit(AuthenticationLoading());
      await userRepository.persistToken(event.token);
      emit(AuthenticationAuthenticated());
    });

    on<LoggedOut>((event, emit) async {
      emit(AuthenticationLoading());
      await Amplify.Auth.signOut();
      await userRepository.deleteToken();
      emit(AuthenticationUnauthenticated());
    });
  }

// @override
// Stream<AuthenticationState> mapEventToState(
//   AuthenticationEvent event,
// ) async* {
//   if (event is AuthStarted) {
//     final bool hasToken = await userRepository.hasToken();
//     final response = await Amplify.Auth.fetchAuthSession();
//     if(response.isSignedIn){
//       log("user is already Logged In");
//     }
//     if (hasToken) {
//       yield AuthenticationAuthenticated();
//     } else {
//       yield AuthenticationUnauthenticated();
//     }
//   }
//

//
//   if (event is LoggedOut) {

//   }
// }
}
