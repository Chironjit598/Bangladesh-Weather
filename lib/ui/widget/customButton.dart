import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weather/const/intiarstial_ads.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function page;
  CustomButton({super.key, required this.title, required this.page});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
      child: InkWell(
        onTap: () {
          intarsitailAds;
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) =>
                  
                  page(),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white12, borderRadius: BorderRadius.circular(20.r)),
          height: 55.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 25.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              Icon(
                Icons.arrow_right_alt_outlined,
                color: Colors.white,
                size: 40.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
