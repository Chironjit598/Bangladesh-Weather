import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather/ui/widget/WeatherItemWithOutDigree.dart';
import 'package:weather/ui/widget/weather_item_widget.dart';

class YeasterDayWeather extends StatefulWidget {
  var weatherModel;
  YeasterDayWeather({super.key, required this.weatherModel});

  @override
  State<YeasterDayWeather> createState() => _YeasterDayWeatherState();
}

class _YeasterDayWeatherState extends State<YeasterDayWeather> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 34, 47, 82),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 13, 32, 78),
          title: Text("আগামীকালের আবহাওয়া"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                
                padding: EdgeInsets.symmetric(vertical: 10.h),
                margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Color.fromARGB(255, 13, 32, 78),
                ),
                child: Column(
                  children: [
                    //===========Date, Days Name Container===========
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(width: 2, color: Colors.white70),
                            color: Color.fromARGB(255, 1, 28, 90)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          child: Text(
                            DateFormat.yMMMMEEEEd().format(DateTime.parse(widget
                                .weatherModel.forecast?.forecastday[1].date)),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),

                    //===========temp, max temp, min temp,  Container===========
                    SizedBox(
                      height: 20.h,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 75.h,
                              width: 175.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.white12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "সর্বোচ্চ তাপমাত্রা",
                                    style: TextStyle(
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: Text(
                                          widget
                                                  .weatherModel
                                                  ?.forecast
                                                  ?.forecastday?[1]
                                                  .day
                                                  ?.maxtempC
                                                  ?.round()
                                                  .toString() ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: Text(
                                          "o",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              height: 75.h,
                              width: 175.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.white12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "সর্বনিম্ন তাপমাত্রা ",
                                    style: TextStyle(
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: Text(
                                          widget
                                                  .weatherModel
                                                  ?.forecast
                                                  ?.forecastday?[1]
                                                  .day
                                                  ?.mintempC
                                                  ?.round()
                                                  .toString() ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: Text(
                                          "o",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 175.h,
                          width: 80.w,
                          child: Column(
                            children: [
                              Image.network(
                                  "https:${widget.weatherModel?.forecast?.forecastday?[1].day?.condition?.icon ?? ""}"),
                              Text(
                                widget.weatherModel?.forecast?.forecastday?[1]
                                        .day?.condition?.text ??
                                    "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Colors.white12),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7.h, horizontal: 20.w),
                                  child: Column(
                                    children: [
                                      Text(
                                        "সূর্যোদয়",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        widget
                                                .weatherModel
                                                ?.forecast
                                                ?.forecastday?[1]
                                                .astro
                                                ?.sunrise ??
                                            "",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Colors.white12),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7.h, horizontal: 20.w),
                                  child: Column(
                                    children: [
                                      Text(
                                        "সূর্যাস্ত",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Text(
                                          widget
                                                  .weatherModel
                                                  ?.forecast
                                                  ?.forecastday?[1]
                                                  .astro
                                                  ?.sunset ??
                                              "",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //===========Others Dettails for example: himudity, wind, feel likes===========
                    //========অনুভূতিশীল তাপমাত্রা====================

                    WeatherItemWidget(
                        title: "অনুভূতিশীল তাপমাত্রা ( 1 PM)",
                        value: widget.weatherModel?.forecast?.forecastday?[1]
                                .hour?[14].feelslikeC
                                ?.round()
                                .toString() ??
                            ""),

                    //========Wind====================

                    WeatherItemWithOutDigree(
                        title: "সর্বোচ্চ বাতাসের গতি",
                        value:
                            "${widget.weatherModel?.forecast?.forecastday?[1].day?.maxwindKph} km/h"),

                    //========বৃষ্টিপাতের পরিমাণ====================

                    WeatherItemWithOutDigree(
                        title: "বৃষ্টি হওয়ার সম্ভাবনা",
                        value:
                            "${widget.weatherModel?.forecast?.forecastday?[1].day?.dailyChanceOfRain} %"),

                    //========দূরত্বের দৃশ্যমানতা====================


                      WeatherItemWithOutDigree(
              title: "দূরত্বের দৃশ্যমানতা",
              value:
                  "${widget.weatherModel?.forecast.forecastday[1].day.avgvisKm} km"),

          //==========কুয়াশা হওয়ার সম্ভাবনা  ====================

          WeatherItemWithOutDigree(
              title: "কুয়াশা হওয়ার সম্ভাবনা ",
              value:
                  "${widget.weatherModel?.forecast?.forecastday[1].day.dailyChanceOfSnow} %"),
                    //========আদ্রতা ====================

                      WeatherItemWithOutDigree(
                        title: "আদ্রতা",
                        value:
                            "${widget.weatherModel?.forecast.forecastday[1].day.avghumidity} %"),


                 ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Color.fromARGB(255, 1, 28, 90)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Text(
                    "প্রতি ঘণ্টার আবহাওয়া",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 170.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        widget.weatherModel.forecast.forecastday[1].hour.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 1.w, top: 10.h, bottom: 20.h),
                        child: Container(
                          width: 120.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white24,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.h),
                                    child: Text(
                                      widget.weatherModel.forecast
                                          .forecastday[1].hour[index].tempC
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
                                        color: Colors.white, fontSize: 15.sp),
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
                              Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.teal),
                                child: Image.network(
                                    "https:${widget.weatherModel.forecast.forecastday[1].hour[index].condition.icon}"),
                              ),
                              Text(
                                DateFormat.j().format(
                                  DateTime.parse(
                                    widget.weatherModel.forecast.forecastday[1]
                                        .hour[index].time,
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
