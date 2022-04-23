import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onPressed;
  final double width;
  final double radius;
  final Color titleColor;

  CommonButton(
      {@required this.title,
      @required this.color,
      @required this.onPressed,
      @required this.width,
      this.radius,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
        style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: titleColor == null ? Colors.white : titleColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  radius != null ? radius : 20.sp), // <-- Radius
            ),
            // padding: EdgeInsets.symmetric(
            //     horizontal: 128.w, vertical: 20.h),
            textStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }
}
