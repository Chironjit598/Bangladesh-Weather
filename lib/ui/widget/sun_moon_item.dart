import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget SunMoonItem(
    {required img,
    required sunriseTitle,
    required sunriseValue,
    required sunsetTitle,
    required sunsetValue}) {
  return Container(
      height: 140.h,
      width: 195.w,
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        children: [
          Container(
            height: 75.h,
            width: 75.w,
            child: Image.network(img),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Text(
                  sunriseTitle,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Text(
                sunriseValue,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0.w),
                child: Text(
                  sunsetTitle,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Text(
                sunsetValue,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          )
        ],
      ));
}
