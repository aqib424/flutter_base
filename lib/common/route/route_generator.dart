import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slaughterandrancher/feature/home/home.dart';
import 'package:slaughterandrancher/feature/home/succes.dart';
import 'package:slaughterandrancher/feature/landing/landing_page.dart';
import 'package:slaughterandrancher/feature/profile/ui/profile.dart';
import 'package:slaughterandrancher/feature/schedule_appointment/ui/schedule_appointment.dart';
import 'package:slaughterandrancher/feature/schedule_appointment/ui/select_appointment_time.dart';
import 'package:slaughterandrancher/feature/signin_signup/resources/auth_repository.dart';
import 'package:slaughterandrancher/feature/signin_signup/ui/change_password.dart';
import 'package:slaughterandrancher/feature/signin_signup/ui/forgot_password.dart';
import 'package:slaughterandrancher/feature/signin_signup/ui/sign_in_page.dart';
import 'package:slaughterandrancher/feature/signin_signup/ui/sign_up_page.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_) => LandingPage());

      case Routes.home:
        return MaterialPageRoute<dynamic>(builder: (_) => Home());

      case Routes.scheduleAppointment:
        return MaterialPageRoute<dynamic>(
            builder: (_) => ScheduleAppointment());

      case Routes.profile:
        return MaterialPageRoute<dynamic>(builder: (_) => Profile());

      case Routes.forgotPassword:
        return MaterialPageRoute<dynamic>(builder: (_) => ForgotPassword());

      case Routes.changePassword:
        return MaterialPageRoute<dynamic>(builder: (_) => ChangePassword());

      case Routes.selectAppointmentTime:
        return MaterialPageRoute<dynamic>(
            builder: (_) => SelectAppointmentTime(
                  text: args,
                ));

      case Routes.success:
        return MaterialPageRoute<dynamic>(builder: (_) => Success());

      case Routes.signIn:
        return MaterialPageRoute<dynamic>(builder: (_) => SignInPage());

        return _errorRoute();

      case Routes.signUp:
        if (args is AuthRepository) {
          return MaterialPageRoute<dynamic>(
              builder: (_) => SignUpPage(authRepository: args));
        }

        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
