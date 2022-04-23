import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:slaughterandrancher/app/theme.dart';
import 'package:slaughterandrancher/common/route/routes.dart';
import 'package:slaughterandrancher/common/widget/common_button.dart';
import 'package:slaughterandrancher/common/widget/common_textfield.dart';

import '../../../common/util/form_validator.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("What’s your email?",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          letterSpacing: -0.02,
                          color: Colors.black)),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 28.h,
                  ),
                  child: Text(
                      "To reset your password, we’ll send a code to your email that you will use to unlock your account.",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          letterSpacing: -0.02,
                          color: Colors.black)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.h, bottom: 113.h),
                  child: Text(
                      "It can take up to a few minutes to recieve the code.",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
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
                    margin: EdgeInsets.only(top: 102.h),
                    child: CommonButton(
                        title: "Submit",
                        color: primaryColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushNamed(context, Routes.changePassword);
                          }
                        },
                        width: 314.w))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
