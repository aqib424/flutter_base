import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/common/bloc/simple_bloc_delegate.dart';
import 'package:flutter_boilerplate/common/constant/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      runApp(App(env: EnvValue.production));
    },
    blocObserver: SimpleBlocDelegate(),
  );
}
