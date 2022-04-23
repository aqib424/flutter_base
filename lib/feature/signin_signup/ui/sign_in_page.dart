import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:slaughterandrancher/app/theme.dart';
import 'package:slaughterandrancher/common/route/routes.dart';
import 'package:slaughterandrancher/common/util/form_validator.dart';
import 'package:slaughterandrancher/common/widget/common_button.dart';
import 'package:slaughterandrancher/common/widget/common_textfield.dart';

import '../../../common/widget/loading_widget.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../authentication/bloc/authentication_event.dart';
import '../bloc/index.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocProvider(
        create: (context) => SignInBloc(),
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              if (state.token != null) {
                BlocProvider.of<AuthenticationBloc>(context)
                  ..add(LoggedIn(token: state.token));
                Navigator.popUntil(context, (route) => route.isFirst);
              }
            }
            if (state is SignInFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 60.h),
                          child:
                              Image.asset("assets/images/arrowquip_logo.png"),
                        ),
                        CommonTextField(
                            controller: emailController,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: primaryColor,
                            ),
                            surfixIcon: null,
                            validator: (value) {
                              String error = FormValidator.validateEmail(value);
                              if (error == null) {
                                return null;
                              }
                              return error;
                            },
                            hintText: "Email",
                            keyboardType: TextInputType.emailAddress),
                        Container(
                          // height: 90,
                          margin: EdgeInsets.symmetric(vertical: 20.h),
                          child: CommonTextField(
                              controller: passwordController,
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: primaryColor,
                              ),
                              surfixIcon: Container(
                                  margin: EdgeInsets.only(right: 20.w),
                                  child: Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.black.withOpacity(0.2),
                                  )),
                              validator: (value) {
                                String error =
                                    FormValidator.validatePassword(value);
                                if (error == null) {
                                  return null;
                                }
                                return error;
                              },
                              hintText: "Password",
                              keyboardType: TextInputType.visiblePassword),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.forgotPassword);
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 10.h, bottom: 50.h),
                              child: Text(
                                "Forgot Password?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor),
                              )),
                        ),
                        state is SignInLoading
                            ? LoadingWidget(
                                visible: true,
                              )
                            : CommonButton(
                                width: 304,
                                color: primaryColor,
                                title: "Login",
                                onPressed: () {
                                  onLoginPressed(context);
                                },
                              ),
                      ],
                    ),
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
    if (_formKey.currentState.validate()) {
      BlocProvider.of<SignInBloc>(context).add(SignInButtonPressed(
          username: emailController.text.trim(),
          password: passwordController.text));
    }
  }
}
