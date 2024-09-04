import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

Widget LoccationAndTimeContainer({required location, required date}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 8.w),
    decoration: BoxDecoration(

        //color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white12),
    child: Column(
      children: [
        Text(
          location,
          style: TextStyle(
            fontSize: 30.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          DateFormat.yMMMMEEEEd().format(DateTime.parse(
             date)),
          style: TextStyle(
            fontSize: 25.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
