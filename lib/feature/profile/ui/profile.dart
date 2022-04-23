import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slaughterandrancher/app/theme.dart';

import '../../authentication/bloc/index.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24.sp,
          ),
        ),
        title: Text("My Profile",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationUnauthenticated) {
            log("logged Out Successfully");
            Navigator.popUntil(context, (route) => route.isFirst);
          }
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 94.h,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                        ),
                        Container(
                          height: 613.5.h,
                          width: MediaQuery.of(context).size.width,
                          color: backgroundColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 76.h),
                                child: Text("Russ’s Fab Ranch",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22.sp,
                                            color: Colors.black)),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(top: 14.h, bottom: 48.h),
                                child: Text("141 Railway St., Woodlands, MB",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15.sp,
                                            color:
                                                Colors.black.withOpacity(0.5))),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 16.w, bottom: 12.h, right: 16.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.w, vertical: 18.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  color: Colors.white,
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/profile/person_pin.svg"),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Text("Account Info",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.sp,
                                                      color: Colors.black))
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.black.withOpacity(0.4),
                                        size: 18.sp,
                                      )
                                    ]),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 16.w, bottom: 12.h, right: 16.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.w, vertical: 18.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  color: Colors.white,
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.settings_outlined,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Text("Settings",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.sp,
                                                      color: Colors.black))
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.black.withOpacity(0.4),
                                        size: 18.sp,
                                      )
                                    ]),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 16.w, bottom: 12.h, right: 16.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.w, vertical: 18.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  color: Colors.white,
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/profile/headphone.svg"),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Text("Help Center",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.sp,
                                                      color: Colors.black))
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.black.withOpacity(0.4),
                                        size: 18.sp,
                                      )
                                    ]),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 16.w, bottom: 106.h, right: 16.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.w, vertical: 18.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  color: Colors.white,
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline,
                                            color: Colors.black,
                                            size: 24.sp,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Text("About",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.sp,
                                                      color: Colors.black))
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.black.withOpacity(0.4),
                                        size: 18.sp,
                                      )
                                    ]),
                              ),
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(LoggedOut());
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 26.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Logout",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  color: primaryColor)),
                                      SizedBox(
                                        width: 9.w,
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/profile/logout.svg")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 34.h,
                    left: 6.w,
                    right: 6.w,
                    child: Container(
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/profile/profile_place_holder.png")),
                          color: Color(0xFFFAD9DC)),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
