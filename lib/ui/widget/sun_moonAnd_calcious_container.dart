import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget SunMoonAndTamparaturContainer({required img, required temp, required text}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.white10),
        child: Image.network(
          img,
        ),
      ),
      Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Text(
                 temp,
                  style: TextStyle(
                      fontSize: 80.sp,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "o",
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
              Text(
                "c",
                style: TextStyle(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ],
          ),
          Container(
            width: 150.w,
            height: 90.h,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ),
        ],
      ),
    ],
  );
}
