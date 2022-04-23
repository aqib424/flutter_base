import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/theme.dart';

class Appointments extends StatefulWidget {
  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  bool isUpComing = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 58.h,
            color: Colors.white,
            padding: EdgeInsets.only(top: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {});
                    isUpComing = true;
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 18.h),
                        child: Text(
                          "Upcoming",
                          style: isUpComing
                              ? Theme.of(context).textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  letterSpacing: -0.01,
                                  color: Colors.black)
                              : Theme.of(context).textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  letterSpacing: -0.01,
                                  color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                      Container(
                        height: 4.h,
                        width: 36.w,
                        color: isUpComing ? Colors.black : Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 112.w,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {});
                    isUpComing = false;
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 18.h),
                        child: Text(
                          "Completed",
                          style: isUpComing
                              ? Theme.of(context).textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  letterSpacing: -0.01,
                                  color: Colors.black.withOpacity(0.5))
                              : Theme.of(context).textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.01,
                                  fontSize: 16.sp,
                                  color: Colors.black),
                        ),
                      ),
                      Container(
                        height: 4.h,
                        width: 36.w,
                        color: isUpComing ? Colors.white : Colors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 104.h,
            // width: 342.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                color: Colors.white),
            child: Row(
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.sp),
                      color: Color(0xFFD22030).withOpacity(0.1)),
                  child: Image.asset("assets/images/placeholder.png"),
                ),
                Expanded(
                  child: Container(
                    height: 68.h,
                    // width: 208.w,
                    margin: EdgeInsets.only(
                      left: 12.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Expanded(
                            child: Text("Arrowquip Kokomo",
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.sp,
                                        color: Colors.black)),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/images/appointment/calender.svg"),
                              SizedBox(
                                width: 6.w,
                              ),
                              Expanded(
                                child: Text("Tuesday April 12th, 2022",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color:
                                                Colors.black.withOpacity(0.7))),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: Colors.black,
                              size: 16.sp,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text("2.5miles from you",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: Colors.black.withOpacity(0.7)))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
