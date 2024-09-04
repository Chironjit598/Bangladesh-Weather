import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HourByWeather extends StatefulWidget {
  var weatherModel;
   HourByWeather({super.key, required this.weatherModel});

  @override
  State<HourByWeather> createState() => _HourByWeatherState();
}

class _HourByWeatherState extends State<HourByWeather> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
         backgroundColor:  Color.fromARGB(255, 34, 47, 82),
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 13, 32, 78),
        title: Text("প্রতি ঘণ্টার আবহাওয়া"),
      ),
      body: Column(children: [
        SizedBox(
          height: 833.h,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount:
                  widget.weatherModel?.forecast?.forecastday[0].hour.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 13, 32, 78),
                        borderRadius: BorderRadius.circular(30.r)),
                    height: 170.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //====================timae, Image ======================
                        Container(
                          width: 100.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "সময়",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    DateFormat.j().format(DateTime.parse(widget
                                        .weatherModel
                                        .forecast
                                        .forecastday[0]
                                        .hour[index]
                                        .time)),
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.teal),
                                child: Image.network(
                                    "https:${widget.weatherModel.forecast.forecastday[0].hour[index].condition.icon}"),
                              ),
                            ],
                          ),
                        ),

                        //====================temp ======================

                        Container(
                          width: 100.w,
                          height: 150.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    " তাপমাত্রা ",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.h),
                                        child: Text(
                                          widget.weatherModel.forecast
                                              .forecastday[0].hour[index].tempC
                                              .round()
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        "O",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.h),
                                        child: Text(
                                          "c",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontSize: 20.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                widget.weatherModel?.forecast?.forecastday?[0]
                                        .day?.condition?.text ??
                                    "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18.sp),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 200.w,
                          child: Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Colors.white12),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 15.w),
                                    child: Column(
                                      children: [
                                        Text(
                                          "বৃষ্টি হওয়ার সম্ভাবনা ",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget
                                                      .weatherModel
                                                      ?.forecast
                                                      ?.forecastday?[0]
                                                      .day
                                                      ?.dailyChanceOfRain
                                                      .toString() ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              " %",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Colors.white12),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.h, horizontal: 15.w),
                                    child: Column(
                                      children: [
                                        Text(
                                          "অনুভূতিশীল তাপমাত্রা",
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 15.h),
                                              child: Text(
                                                widget
                                                        .weatherModel
                                                        ?.forecast
                                                        ?.forecastday?[0]
                                                        .hour?[index]
                                                        .feelslikeC
                                                        ?.round()
                                                        .toString() ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Text(
                                              "o",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 15.h),
                                              child: Text(
                                                "c",
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ]),
    );
 
  }
}