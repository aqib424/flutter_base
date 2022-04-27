import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:slaughterandrancher/app/theme.dart';
import 'package:slaughterandrancher/common/route/routes.dart';
import 'package:slaughterandrancher/common/widget/common_button.dart';
import 'package:slaughterandrancher/common/widget/common_textfield.dart';

import '../../../common/util/form_validator.dart';
import '../bloc/index.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordBloc(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 30.sp,
            ),
          ),
        ),
        body: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
          listener: (context, state) {
            if (state is CodeSentSuccessful) {
              log("CodeSentSuccessfull");
              Navigator.pushNamed(context, Routes.changePassword,
                  arguments: emailController.text);
            }
          },
          child: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Form(
                  key: _formKey,
                  autovalidateMode: isValid
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("What’s your \nemail?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 35.sp,
                                      letterSpacing: -0.02,
                                      color: primaryColor)),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 28.h,
                          ),
                          child: Text(
                              "To reset your password, we’ll send a code to your email that you will use to unlock your account.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      letterSpacing: -0.02,
                                      color: Colors.black)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.h, bottom: 64.h),
                          child: Text(
                              "It can take up to a few minutes to recieve the code.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      letterSpacing: -0.02,
                                      color: Colors.black)),
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
                            margin: EdgeInsets.only(top: 46.h),
                            child: CommonButton(
                                title: "Submit",
                                color: primaryColor,
                                onPressed: () {
                                  log("onPressed");
                                  if (_formKey.currentState.validate()) {
                                    BlocProvider.of<ForgetPasswordBloc>(context)
                                        .add(ForgotPasswordButtonPressed(
                                            email: emailController.text));
                                  } else {
                                    isValid = true;
                                    setState(() {});
                                  }
                                },
                                width: 314.w))
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
}
