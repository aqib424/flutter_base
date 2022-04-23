import 'dart:async';
import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slaughterandrancher/common/bloc/simple_bloc_delegate.dart';
import 'package:slaughterandrancher/common/constant/env.dart';

import 'amplifyconfiguration.dart';
import 'app/debug_app.dart';

Future<void> _configureAmplify() async {
  try {
    // Add the following line to add Auth plugin to your app.
    await Amplify.addPlugin(AmplifyAuthCognito());

    // call Amplify.configure to use the initialized categories in your app
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    log('An error occurred configuring Amplify: $e');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await _configureAmplify();

  BlocOverrides.runZoned(
    () {
      runApp(DebugApp(env: EnvValue.development));
    },
    blocObserver: SimpleBlocDelegate(),
  );
}
