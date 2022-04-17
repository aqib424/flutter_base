import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:slaughterandrancher/common/widget/loading_widget.dart';
import 'package:slaughterandrancher/feature/authentication/bloc/authentication_bloc.dart';
import 'package:slaughterandrancher/feature/authentication/bloc/authentication_event.dart';
import 'package:slaughterandrancher/feature/signin_signup/bloc/index.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF214d27),
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              BlocProvider.of<AuthenticationBloc>(context)
                ..add(LoggedIn(token: state.token));
              Navigator.popUntil(context, (route) => route.isFirst);
            }
          },
          child: BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              if (state is SignInFailure) {
                return Center(
                  child: Text(state.error),
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 90.h),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                      ),
                      Container(
                        height: 90.h,
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: EdgeInsets.only(top: 60.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Email"),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                // labelText: "Email",
                                hintText: "Email",
                                enabled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),

                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 22.h,
                                ),
                              ),
                              validator: (value) {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 90,
                        margin: EdgeInsets.only(bottom: 14.h, top: 20.h),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                // labelText: "Email",
                                hintText: "Password",
                                enabled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 4.w,
                                    color: Colors.red,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 22.h,
                                ),
                              ),
                              validator: (value) {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20.w, bottom: 28.h),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xFF214d27),
                                fontWeight: FontWeight.bold),
                          )),
                      state is SignInLoading
                          ? LoadingWidget(
                              visible: true,
                            )
                          : ElevatedButton(
                              onPressed: () {
                                onLoginPressed(context);
                              },
                              child: Text("Login"),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF214d27),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(8), // <-- Radius
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 144.w, vertical: 20.h),
                                  textStyle: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold)),
                            )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void onLoginPressed(BuildContext context) {
    BlocProvider.of<SignInBloc>(context).add(SignInButtonPressed(
        username: emailController.text.trim(),
        password: passwordController.text));
  }
}
