import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/widget/loading_widget.dart';
import 'package:flutter_boilerplate/feature/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_boilerplate/feature/authentication/bloc/authentication_event.dart';
import 'package:flutter_screenutil/size_extension.dart';

import '../signin_signup/bloc/index.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc()..add(UserSignedIn()),
      child: Scaffold(
        body: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            if (state is UserSignedInSuccess) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Login Successful\n ${state.userName}"),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 60.h),
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(LoggedOut());
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: Text("Sign Out"),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF214d27),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8.sp), // <-- Radius
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 132.w, vertical: 20.h),
                            textStyle: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              );
            }
            return LoadingWidget(
              visible: true,
            );
          },
        ),
      ),
    );
  }
}
