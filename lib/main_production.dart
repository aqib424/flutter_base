import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slaughterandrancher/app/app.dart';
import 'package:slaughterandrancher/common/bloc/simple_bloc_delegate.dart';
import 'package:slaughterandrancher/common/constant/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      runApp(App(env: EnvValue.production));
    },
    blocObserver: SimpleBlocDelegate(),
  );
}