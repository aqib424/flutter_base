import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

import '../../../app/theme.dart';
import '../../../common/util/form_validator.dart';
import '../../../common/widget/common_button.dart';
import '../../../common/widget/common_textfield.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                  child: Text("Enter your code",
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
                      "Enter the code that you recieved in the email and choose a new password.",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          letterSpacing: -0.02,
                          color: Colors.black)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.h, bottom: 38.h),
                  child: Text(
                      "Passwords must be at least 6 characters, have an uppercase leter and a special symbol.",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          letterSpacing: -0.02,
                          color: Colors.black)),
                ),
                CommonTextField(
                    controller: codeController,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: primaryColor,
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
                        String error = FormValidator.validatePassword(value);
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
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
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
