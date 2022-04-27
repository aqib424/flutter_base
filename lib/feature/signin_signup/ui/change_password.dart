import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/theme.dart';
import '../../../common/util/form_validator.dart';
import '../../../common/widget/common_button.dart';
import '../../../common/widget/common_textfield.dart';
import '../bloc/index.dart';

class ChangePassword extends StatefulWidget {
  final String email;

  ChangePassword({@required this.email});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
            if (state is FailedToChangePassword) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
            if (state is PasswordChanged) {
              Navigator.popUntil(context, (route) => route.isFirst);
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
                          child: Text("Enter your \nVerification code",
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
                              "Enter the code that you recieved in the email and choose a new password.",
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
                          margin: EdgeInsets.only(
                            top: 16.h,
                          ),
                          child: Text("Password Requirements:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      letterSpacing: -0.02,
                                      color: Colors.black)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4.h, bottom: 38.h),
                          child: Text(
                              " \u2022  At least 8 characters \n \u2022  At least 1 uppercase letter \n \u2022  At least 1 lowercase letter \n \u2022  At least 1 number",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      letterSpacing: -0.02,
                                      color: Colors.black.withOpacity(0.8))),
                        ),
                        CommonTextField(
                            controller: codeController,
                            prefixIcon: Container(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                "assets/images/bar_code.svg",
                              ),
                            ),
                            surfixIcon: null,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please Enter Code";
                              } else if (value.length < 4) {
                                return "Code must be atleast 4 characters";
                              }
                            },
                            hintText: "Enter Code",
                            keyboardType: TextInputType.emailAddress),
                        Container(
                          // height: 90,
                          margin: EdgeInsets.only(top: 20.h),
                          child: CommonTextField(
                              controller: passwordController,
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: primaryColor,
                              ),
                              surfixIcon: null,
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
                        Container(
                          // height: 90,
                          margin: EdgeInsets.only(top: 20.h),
                          child: CommonTextField(
                              controller: confirmPasswordController,
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: primaryColor,
                              ),
                              surfixIcon: null,
                              validator: (value) {
                                if (value == passwordController.text) {
                                  return null;
                                }
                                return "Password mismatch";
                              },
                              hintText: "Re-enter Password",
                              keyboardType: TextInputType.visiblePassword),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 102.h),
                            child: CommonButton(
                                title: "Reset Password",
                                color: primaryColor,
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    BlocProvider.of<ForgetPasswordBloc>(context)
                                        .add(ChangePasswordButtonPressed(
                                            code: codeController.text,
                                            newPassword:
                                                passwordController.text,
                                            email: widget.email));
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
