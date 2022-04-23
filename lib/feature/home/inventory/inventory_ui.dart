import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slaughterandrancher/app/theme.dart';

class InventoryUI extends StatefulWidget {
  @override
  State<InventoryUI> createState() => _InventoryUIState();
}

class _InventoryUIState extends State<InventoryUI> {
  bool isHerd = true;
  List<Map> forSale = [
    {
      "name": "Fillet Mignon",
      "quantity": "12",
      "image": "assets/images/inventory/round_roast.png"
    },
    {
      "name": "Round Roast",
      "quantity": "3",
      "image": "assets/images/inventory/fillet_mignon.png"
    }
  ];

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
                    isHerd = true;
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 18.h),
                        child: Text(
                          "Processed",
                          style: isHerd
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
                        color: isHerd ? Colors.black : Colors.white,
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
                    isHerd = false;
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 18.h),
                        child: Text(
                          "For Sale",
                          style: isHerd
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
                        color: isHerd ? Colors.white : Colors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          isHerd
              ? Container(
                  height: 104.h,
                  width: 342.w,
                  margin:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          color: Colors.green,
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/inventory/cow.png"),
                              fit: BoxFit.contain),
                        ),
                      ),
                      Container(
                        height: 46.h,
                        margin: EdgeInsets.only(left: 16.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                // margin: EdgeInsets.only(bottom: 20.h),
                                child: Text("Betty The Cow",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.sp,
                                            color: Colors.black))),
                            Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/inventory/settings.svg"),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text("Manage",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : _forSaleWidget(context),
        ],
      ),
    );
  }

  _forSaleWidget(BuildContext context) {
    return ListView.builder(
        itemCount: forSale.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 104.h,
            width: 342.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                color: Colors.white),
            child: Row(
              children: [
                Container(
                  height: 80.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: Colors.green,
                    image: DecorationImage(
                        image: AssetImage(forSale[index]["image"]),
                        fit: BoxFit.contain),
                  ),
                ),
                Container(
                  height: 46.h,
                  margin: EdgeInsets.only(left: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          // margin: EdgeInsets.only(bottom: 20.h),
                          child: Text(forSale[index]["name"],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.sp,
                                      color: Colors.black))),
                      Text("QTY: ${forSale[index]["quantity"]}",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Colors.black)),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
