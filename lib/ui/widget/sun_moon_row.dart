import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/ui/widget/sun_moon_item.dart';

Widget SunMoonWidget({required weatherModel}) {
  return Padding(
    padding: EdgeInsets.only(left: 10.w, right: 7.0.w, top: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //===========Sun Container=========

        SunMoonItem(
            img: "https://cdn.weatherapi.com/weather/64x64/day/113.png",
            sunriseTitle: "সূর্যোদয় :  ",
            sunriseValue:
                weatherModel?.forecast?.forecastday?[0].astro?.sunrise ?? "",
            sunsetTitle: "সূর্যাস্ত :  ",
            sunsetValue:
                weatherModel?.forecast?.forecastday?[0].astro?.sunset ?? ""),

        //=========Moon Container===========

        SunMoonItem(
            img: "https://cdn.weatherapi.com/weather/64x64/night/113.png",
            sunriseTitle: "চন্দ্রোদয়:  ",
            sunriseValue:
                weatherModel?.forecast?.forecastday?[0].astro?.moonrise ?? "",
            sunsetTitle: "চন্দ্রাস্ত :  ",
            sunsetValue:
                weatherModel?.forecast?.forecastday?[0].astro?.moonset ?? ""),
      ],
    ),
  );
}
