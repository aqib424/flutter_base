import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

import '../../app/theme.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget prefixIcon;
  final Widget surfixIcon;
  final Function validator;
  final String hintText;
  final TextInputType keyboardType;

  CommonTextField(
      {@required this.controller,
      @required this.prefixIcon,
      @required this.surfixIcon,
      @required this.validator,
      @required this.hintText,
      @required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: surfixIcon,
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        enabled: true,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
          borderSide: BorderSide(
            width: 1,
            color: primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
          borderSide: BorderSide(
            width: 1,
            color: Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 22.h,
        ),
      ),
      validator: validator,
    );
  }
}
