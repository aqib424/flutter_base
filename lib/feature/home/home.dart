import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/theme.dart';
import '../../common/widget/loading_widget.dart';
import '../signin_signup/bloc/index.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc()..add(UserSignedIn()),
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is UserSignedInSuccess) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.h, left: 2.w),
                      child: Text(
                        "Next Appointment",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            color: Colors.black),
                      ),
                    ),
                    _appointmentWidget(context),
                    Container(
                      margin: EdgeInsets.only(top: 20.h, bottom: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dashboard",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color: Colors.black),
                          ),
                          Container(
                            height: 38.h,
                            width: 110.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.w, vertical: 11.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60.sp),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Month",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: Colors.black),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 18.sp,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 210.h,
                      width: 342.w,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage("assets/images/chart.svg"),
                        //     fit: BoxFit.cover
                        // ),
                        // border: Border.all(
                        //   color: Colors.black,
                        // ),
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/chart.svg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 148.h,
                            width: 164.w,
                            margin: EdgeInsets.only(top: 16.h),
                            padding: EdgeInsets.all(18.sp),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Inventory",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.sp,
                                          color: primaryColor),
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Text(
                                  "78",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 40.sp,
                                          color: primaryColor),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/send_Arrow.svg"),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      "13",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.sp,
                                              color: Color(0xFF12B043)),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      "Cattle",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                              color: primaryColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: Container(
                            height: 148.h,
                            width: 164.w,
                            margin: EdgeInsets.only(top: 16.h),
                            padding: EdgeInsets.all(18.sp),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Net Profit",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.sp,
                                          color: primaryColor),
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Text(
                                  "\$20k",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 40.sp,
                                          color: primaryColor),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/send_Arrow.svg"),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      "13",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.sp,
                                              color: Color(0xFF12B043)),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Net Profit",
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp,
                                                color: primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          return LoadingWidget(
            visible: true,
          );
        },
      ),
    );
  }

  Widget _appointmentWidget(BuildContext context) {
    return Container(
      height: 132.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 11.h),
      padding: EdgeInsets.only(
        top: 20.h,
        left: 20.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        color: primaryColor,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF428256), primaryColor],
        ),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/images/appointment.svg"),
          SizedBox(
            width: 15.w,
          ),
          Container(
            width: 190.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Arrowquip Mobile Butchering",
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.white)),
                SizedBox(
                  height: 6.h,
                ),
                Text("Tuesday April 12th, 2022 2:30pm",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.white.withOpacity(0.5))),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text("View Details",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Colors.white)),
                    SizedBox(
                      width: 4.w,
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 16.sp,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
