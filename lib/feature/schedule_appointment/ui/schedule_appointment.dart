import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slaughterandrancher/app/theme.dart';
import 'package:slaughterandrancher/common/route/routes.dart';

class ScheduleAppointment extends StatefulWidget {
  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  Color highAvaiilbility = Color(0xFF12B043);
  Color mediumAvailibility = Color(0xFFFBA703);
  Color lowAvailibility = Color(0xFFD22030);

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
        title: Text("Schedule Appointment",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16.sp),
        color: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nearby Butchers",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.01,
                    fontSize: 20.sp,
                    color: Colors.black)),
            ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.selectAppointmentTime,
                          arguments: index == 0
                              ? "High Availability"
                              : index == 1
                                  ? "Medium Availability"
                                  : "Low Availability");
                    },
                    child: Container(
                      height: 104.h,
                      padding: EdgeInsets.all(12.sp),
                      margin: EdgeInsets.only(top: 14.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: Colors.white,
                      ),
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
                          Container(
                            height: 68.h,
                            width: 208.w,
                            margin: EdgeInsets.only(left: 12.w, top: 6.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text("Arrowquip Indianapolis",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20.sp,
                                              color: Colors.black)),
                                ),
                                Container(
                                  child: Text(
                                      index == 0
                                          ? "High Availability"
                                          : index == 1
                                              ? "Medium Availability"
                                              : "Low Availability",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: index == 0
                                                  ? highAvaiilbility
                                                  : index == 1
                                                      ? mediumAvailibility
                                                      : lowAvailibility)),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/notificaton.svg"),
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
                                                color: Colors.black
                                                    .withOpacity(0.7)))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
