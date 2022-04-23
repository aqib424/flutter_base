import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:slaughterandrancher/common/bloc/connectivity/index.dart';
import 'package:slaughterandrancher/common/constant/env.dart';
import 'package:slaughterandrancher/common/http/api_provider.dart';
import 'package:slaughterandrancher/common/route/route_generator.dart';
import 'package:slaughterandrancher/common/route/routes.dart';
import 'package:slaughterandrancher/common/util/internet_check.dart';
import 'package:slaughterandrancher/feature/authentication/bloc/index.dart';
import 'package:slaughterandrancher/feature/authentication/resource/user_repository.dart';
import 'package:slaughterandrancher/generated/l10n.dart';

class App extends StatefulWidget {
  final Env env;

  App({Key key, @required this.env}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<Env>(
            create: (context) => widget.env,
            lazy: true,
          ),
          RepositoryProvider<InternetCheck>(
            create: (context) => InternetCheck(),
            lazy: true,
          ),
          RepositoryProvider<UserRepository>(
            create: (context) => UserRepository(),
            lazy: true,
          ),
          RepositoryProvider<ApiProvider>(
            create: (context) => ApiProvider(),
            lazy: true,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ConnectivityBloc>(
              create: (context) {
                return ConnectivityBloc();
              },
            ),
            BlocProvider<AuthenticationBloc>(
              create: (context) {
                return AuthenticationBloc(
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context))
                  ..add(AuthStarted());
              },
            ),
          ],
          child: MaterialApp(
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Authenticator demo',
            theme: ThemeData.light(),
            onGenerateRoute: RouteGenerator.generateRoute,
            // builder: Authenticator.builder(),
            initialRoute: Routes.landing,
          ),
        ),
      ),
    );
  }
}
