import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slaughterandrancher/app/theme.dart';
import 'package:slaughterandrancher/common/route/routes.dart';
import 'package:slaughterandrancher/common/widget/common_button.dart';

class SelectAppointmentTime extends StatefulWidget {
  final String text;

  SelectAppointmentTime({@required this.text});

  @override
  State<SelectAppointmentTime> createState() => _SelectAppointmentTimeState();
}

class _SelectAppointmentTimeState extends State<SelectAppointmentTime> {
  int selectedDateIndex = 0;
  int selectTimeIndex = 0;
  int amountOfCattle = 0;
  int addNumber;

  TextEditingController descriptionController = TextEditingController();
  DateTime curdate = DateTime.now();
  int currentDate = DateTime.now().day;
  int selectDateListItemCount;
  int weekday;
  TextEditingController numberOfCattelController = TextEditingController();
  String dayName;

  List<String> weekdays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

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
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120.h,
                padding: EdgeInsets.only(left: 16.w, top: 20.h),
                alignment: Alignment.topLeft,
                color: Colors.white,
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
                            child: Text(widget.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color:
                                    widget.text == "High Availability"
                                        ? Color(0xFF12B043)
                                        : widget.text ==
                                        "Medium Availability"
                                        ? Color(0xFFFBA703)
                                        : Color(0xFFD22030))),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/notificaton.svg"),
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
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.h, left: 16.w, bottom: 10.h),
                alignment: Alignment.topLeft,
                child: Text("Select Date",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.black)),
              ),
              _buildSelectDateWidget(context),
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 16.w, bottom: 10.h),
                alignment: Alignment.topLeft,
                child: Text("Select Time",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.black)),
              ),
              Container(
                height: 258.h,
                margin: EdgeInsets.symmetric(horizontal: 16.h),
                child: GridView.builder(
                    itemCount: 7,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 56.sp,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 12.w),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectTimeIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: index == selectTimeIndex
                                  ? primaryColor
                                  : Colors.white),
                          alignment: Alignment.center,
                          child: Text("06:00 PM",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: index == selectTimeIndex
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 16.w, bottom: 12.h),
                alignment: Alignment.topLeft,
                child: Text("Booking Details",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.black)),
              ),
              Container(
                height: 68.h,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cattle",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 24.sp,
                            color: Colors.black)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            if (numberOfCattelController.text.isEmpty) {
                            } else {
                              if (numberOfCattelController.text != "0") {
                                addNumber =
                                    int.parse(numberOfCattelController.text);
                                numberOfCattelController.text =
                                    (addNumber - 1).toString();
                              }
                            }

                            setState(() {});
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.grey,
                          ),
                        ),

                        Container(
                          width: 30.w,
                          height: 38.h,
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                          child: TextFormField(
                            controller: numberOfCattelController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration.collapsed(
                              hintText: "0",
                            ),
                            validator: (value) {},
                          ),
                        ),

                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 10.w),
                        //   child: Text("${amountOfCattle}",
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .bodyText1
                        //           .copyWith(
                        //           fontWeight: FontWeight.w500,
                        //           fontSize: 24.sp,
                        //           color: Colors.black)),
                        // ),

                        InkWell(
                          onTap: () {
                            if (numberOfCattelController.text.isEmpty) {
                              amountOfCattle = amountOfCattle + 1;
                              numberOfCattelController.text =
                                  amountOfCattle.toString();
                            } else {
                              addNumber =
                                  int.parse(numberOfCattelController.text);
                              numberOfCattelController.text =
                                  (addNumber + 1).toString();
                            }

                            setState(() {});
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 16.w, bottom: 12.h),
                alignment: Alignment.topLeft,
                child: Text("Description",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.black)),
              ),
              Container(
                height: 155.h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: Colors.white),
                child: TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  validator: (value) {},
                  maxLines: 88,
                  decoration: InputDecoration(
                    hintText: "Write Something",
                    hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        letterSpacing: -0.01,
                        color: Colors.black.withOpacity(0.3)),
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 30.h, bottom: 38.h, left: 16.w, right: 16.w),
                child: CommonButton(
                  title: "Request Booking",
                  color: primaryColor,
                  width: 330.w,
                  radius: 20,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.success);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectDateWidget(BuildContext context) {
    log("currentDate ++? $currentDate");
    DateTime lastDayOfMonth = DateTime(curdate.year, curdate.month + 1, 0);
    log("${lastDayOfMonth.month}/${lastDayOfMonth.day}");
    selectDateListItemCount = lastDayOfMonth.day - curdate.day;
    weekday = DateTime.now().weekday;
    return Container(
      height: 110.h,
      margin: EdgeInsets.only(left: 6.w),
      child: ListView.builder(
          itemCount: selectDateListItemCount + 1,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index != 0) {
              currentDate = currentDate + 1;
              weekday = weekday + 1;
            } else {
              currentDate = DateTime.now().day;
              weekday = DateTime.now().weekday;
            }

            return GestureDetector(
              onTap: () {
                selectedDateIndex = index;
                setState(() {});
              },
              child: Container(
                width: 100.w,
                margin: EdgeInsets.only(
                  left: 10.w,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: index == selectedDateIndex
                        ? primaryColor
                        : Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$currentDate",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 34.sp,
                            color: index == selectedDateIndex
                                ? Colors.white
                                : Colors.black)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(weekdays[weekday - 1],
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            color: index == selectedDateIndex
                                ? Colors.white
                                : Colors.black))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
