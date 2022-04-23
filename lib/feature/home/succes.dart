import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:slaughterandrancher/app/theme.dart';
import 'package:slaughterandrancher/common/widget/common_button.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/success.png"),
            SizedBox(
              height: 25.h,
            ),
            Text("Success!",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 30.sp,
                    color: primaryColor)),
            SizedBox(
              height: 20.h,
            ),
            Text("Booking Request \nRecieved!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.black.withOpacity(0.5),
                    height: 1.5)),
            SizedBox(
              height: 144.h,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: CommonButton(
                    title: "Return To Home",
                    color: primaryColor,
                    radius: 20.sp,
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    width: 355.w))
          ],
        ),
      ),
    );
  }
}
