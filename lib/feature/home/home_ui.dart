import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slaughterandrancher/app/theme.dart';
import 'package:slaughterandrancher/common/widget/common_button.dart';
import 'package:slaughterandrancher/feature/home/appointment/appointments.dart';
import 'package:slaughterandrancher/feature/home/home.dart';
import 'package:slaughterandrancher/feature/home/inventory/inventory_ui.dart';

import '../../common/route/routes.dart';

class HomeUI extends StatefulWidget {
  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: currentIndex == 0 ? backgroundColor : Colors.white,
        titleSpacing: 10.w,
        title: Container(
          width: 150.w,
          height: 24.h,
          child: currentIndex == 1
              ? Text(
                  "My Appointment",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: Colors.black),
                )
              : currentIndex == 3
                  ? Text(
                      "My Inventory",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          letterSpacing: -0.01,
                          color: Colors.black),
                    )
                  : Image.asset("assets/images/arrowquip_logo.png"),
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.profile);
              },
              icon: Icon(
                CupertinoIcons.person_crop_circle_fill,
                color: primaryColor,
                size: 35,
              ))
        ],
      ),
      body: currentIndex == 1
          ? Appointments()
          : currentIndex == 3
              ? InventoryUI()
              : Home(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          _buySellModal(context);
        },
        child: Container(
          height: 60.sp,
          width: 60.sp,
          decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF1A5E1E),
              ),
              boxShadow: [
                BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 6)),
              ]),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24.sp,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 76.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(0, -1),
              color: primaryColor.withOpacity(0.1),
              blurRadius: 74.sp)
        ]),
        child: BottomNavigationBar(
          elevation: 0,
          selectedLabelStyle: Theme.of(context).textTheme.bodyText1.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: primaryColor),
          unselectedLabelStyle: Theme.of(context).textTheme.bodyText1.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: unSelectedTextColor),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: primaryColor,
          unselectedItemColor: unSelectedTextColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (value) {
            log("on tap ===> $value");
            if (currentIndex == 2) {
              currentIndex = 0;
              setState(() {});
            } else {
              currentIndex = value;
              setState(() {});
            }
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: Container(
                    margin: EdgeInsets.only(bottom: 6.h),
                    child: SvgPicture.asset(
                      "assets/images/bottom_navigation_bar/home.svg",
                    )),
                icon: Container(
                    margin: EdgeInsets.only(bottom: 6.h),
                    child: SvgPicture.asset(
                      "assets/images/bottom_navigation_bar/home.svg",
                      color: Colors.grey,
                    )),
                label: "Home"),
            BottomNavigationBarItem(
                activeIcon: Container(
                    margin: EdgeInsets.only(bottom: 6.h),
                    child: SvgPicture.asset(
                      "assets/images/bottom_navigation_bar/calendar.svg",
                      color: primaryColor,
                    )),
                icon: Container(
                    margin: EdgeInsets.only(bottom: 6.h),
                    child: SvgPicture.asset(
                        "assets/images/bottom_navigation_bar/calendar.svg")),
                label: "Appointment"),
            BottomNavigationBarItem(icon: Container(), label: ""),
            BottomNavigationBarItem(
                activeIcon: Container(
                    margin: EdgeInsets.only(bottom: 6.h),
                    child: SvgPicture.asset(
                      "assets/images/bottom_navigation_bar/inventory.svg",
                      color: primaryColor,
                    )),
                icon: Container(
                    margin: EdgeInsets.only(bottom: 6.h),
                    child: SvgPicture.asset(
                        "assets/images/bottom_navigation_bar/inventory.svg")),
                label: "Inventory"),
            BottomNavigationBarItem(
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 6.h),
                  child: SvgPicture.asset(
                    "assets/images/bottom_navigation_bar/bar-chart-line.svg",
                    color: primaryColor,
                  ),
                ),
                icon: Container(
                  margin: EdgeInsets.only(bottom: 6.h),
                  child: SvgPicture.asset(
                      "assets/images/bottom_navigation_bar/bar-chart-line.svg"),
                ),
                label: "Stats"),
          ],
        ),
      ),
    );
  }

  void _buySellModal(BuildContext context) {
    showModalBottomSheet(
        barrierColor: Color(0xFF0D2916).withOpacity(0.3),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            height: 300.h,
            color: Color(0xFFF6F6F9).withOpacity(0.2),
            child: Column(
              children: [
                Container(
                  height: 176.h,
                  width: 335.w,
                  margin:
                      EdgeInsets.only(left: 18.w, right: 18.w, bottom: 24.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    // color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.scheduleAppointment);
                        },
                        child: Container(
                          height: 156.h,
                          width: 153.w,
                          margin: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.sp),
                                topLeft: Radius.circular(16.sp),
                                bottomLeft: Radius.circular(16.sp)),
                            color: primaryColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/bull.svg"),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text("Buy",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.sp,
                                          color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.scheduleAppointment);
                        },
                        child: Container(
                          height: 156.h,
                          width: 153.w,
                          // margin: EdgeInsets.only(left: 18.w, right: 18.w ,bottom: 24.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.sp),
                                topLeft: Radius.circular(16.sp),
                                bottomRight: Radius.circular(16.sp)),
                            color: Color(0xFFCF202F),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/cart.svg"),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text("Sell",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.sp,
                                          color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                      left: 18.w,
                      right: 18.w,
                      bottom: 38.h,
                    ),
                    child: CommonButton(
                      title: "Cancel",
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      width: 335.w,
                      radius: 20.sp,
                      titleColor: Colors.black,
                    ))
              ],
            ),
          );
        });
  }
}
