import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:slaughterandrancher/common/widget/loading_widget.dart';
import 'package:slaughterandrancher/feature/authentication/bloc/index.dart';
import 'package:slaughterandrancher/feature/home/home_ui.dart';
import 'package:slaughterandrancher/feature/home/succes.dart';
import 'package:slaughterandrancher/feature/landing/splash_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 812),
        orientation: Orientation.portrait);
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthenticationLoading) {
            return const LoadingWidget(
              visible: true,
            );
          }

          if (state is AuthenticationAuthenticated) {
            return Success();
          }
          if (state is AuthenticationUnauthenticated) {
            // return SignInPage(
            //     authRepository: AuthRepository(
            //         env: RepositoryProvider.of<Env>(context),
            //         apiProvider: RepositoryProvider.of<ApiProvider>(context),
            //         internetCheck:
            //             RepositoryProvider.of<InternetCheck>(context)));
            return Home();
          }

          return SplashPage();
        });
  }
}
