import 'dart:async';
import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/common/bloc/simple_bloc_delegate.dart';
import 'package:flutter_boilerplate/common/constant/env.dart';

import 'amplifyconfiguration.dart';

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
      runApp(App(env: EnvValue.staging));
    },
    blocObserver: SimpleBlocDelegate(),
  );
}
