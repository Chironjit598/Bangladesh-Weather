import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget WeatherItemWithOutDigree({required title, required value}){
    return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ), ],
            ),
          ],
        ),
      ),
      Divider(
        indent: 20,
        endIndent: 20,
        thickness: 2,
        color: Colors.white30,
      ),
    ],
  );

}