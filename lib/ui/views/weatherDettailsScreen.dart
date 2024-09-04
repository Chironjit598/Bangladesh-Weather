import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/ui/widget/WeatherItemWithOutDigree.dart';
import 'package:weather/ui/widget/weather_item_widget.dart';
import 'package:weather/ui/widget/wind_speed_widget.dart';

class WeatherDettailsScreen extends StatelessWidget {
  var weatherModel;
  WeatherDettailsScreen({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("বিস্তারিত দেখুন"),
        backgroundColor: Color.fromARGB(255, 13, 32, 78),
        elevation: 5,
      ),
      backgroundColor: Color.fromARGB(255, 13, 32, 78),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),

            //============image, temp, clear=================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Image.network(
                      "https:${weatherModel?.current?.condition.icon}"),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        weatherModel.current.tempC.round().toString(),
                        style: TextStyle(
                            fontSize: 50.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "o",
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              weatherModel?.current?.condition.text,
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(
              height: 90.h,
            ),

            //============max, min=================

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 145.h,
                    width: 260.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                "সর্বোচ্চ",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          indent: 140.w,
                          thickness: 2,
                          height: 1,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        //============max temp=================

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "তাপমাত্রা",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "${weatherModel?.forecast.forecastday[0].day.maxtempC.round().toString()}",
                                      style: TextStyle(
                                          fontSize: 19.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    "o",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "c",
                                      style: TextStyle(
                                          fontSize: 20.sp, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          height: 15.h,
                          color: Colors.white54,
                        ),

                        //============max wind=================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "বাতাস",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "${weatherModel?.forecast.forecastday[0].day.maxwindKph.round().toString()}",
                                      style: TextStyle(
                                          fontSize: 19.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text(""),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      " km/h",
                                      style: TextStyle(
                                          fontSize: 16.sp, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          height: 10.h,
                          color: Colors.white54,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 140.h,
                    width: 0.w,
                    color: Colors.white54,
                  ),
                  Container(
                    height: 140.h,
                    width: 110.w,
                    child: Column(
                      children: [
                        Text(
                          "সর্বনিম্ন",
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white),
                        ),
                        Divider(
                          thickness: 2,
                          height: 2,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        //============min temp= ================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "${weatherModel?.forecast.forecastday[0].day.mintempC.round().toString()}",
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              "o",
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "c",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          height: 5.h,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        //============min wind=================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "${weatherModel?.forecast.forecastday[0].day.maxwindMph.round().toString()}",
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Text(""),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                " km/h",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          height: 8.h,
                          color: Colors.white54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //=========বাতাসের গতিপ্রবাহ=================
            WindSpeedWidget(
                title: "বাতাসের গতিপ্রবাহ",
                windDir: "(${weatherModel?.current?.windDir}) ",
                value: "${weatherModel?.current?.windKph} km/h"),

            //========আচমকা এলোমেলো বাতাসের গতিপ্রবাহ====================
            WeatherItemWithOutDigree(
                title: "দমকা বাতাসের গতিপ্রবাহ",
                value: "${weatherModel?.current?.gustKph} km/h"),

            //========অনুভূতিশীল তাপমাত্রা ===================

            WeatherItemWidget(
                title: "অনুভূতিশীল তাপমাত্রা",
                value: weatherModel?.current?.feelslikeC?.round().toString() ??
                    ""),

            //========বৃষ্টি হওয়ার সম্ভাবনা ====================

            WeatherItemWithOutDigree(
                title: "বৃষ্টি হওয়ার সম্ভাবনা",
                value:
                    "${weatherModel?.forecast?.forecastday?[0].day?.dailyChanceOfRain} %"),

            //========বৃষ্টিপাতের পরিমাণ  ====================

            WeatherItemWithOutDigree(
                title: "বৃষ্টিপাতের পরিমাণ ",
                value:
                    "${weatherModel?.current.precipMm.round().toString()} mm"),

            //==========কুয়াশা হওয়ার সম্ভাবনা  ====================

            WeatherItemWithOutDigree(
                title: "কুয়াশা হওয়ার সম্ভাবনা ",
                value:
                    "${weatherModel?.forecast?.forecastday[0].day.dailyChanceOfSnow} %"),

            //==========মেঘের আচ্ছাধন   ====================

            WeatherItemWithOutDigree(
                title: "মেঘের আচ্ছাধন ",
                value: "${weatherModel?.current.cloud} %"),

            //==========আদ্রতা   ====================

            WeatherItemWithOutDigree(
                title: "আদ্রতা", value: "${weatherModel?.current.humidity} %"),

            //==========বায়ুচাপ====================

            WeatherItemWithOutDigree(
                title: "বায়ুচাপ",
                value:
                    "${weatherModel?.current?.pressureMb.round().toString()} mb"),

            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
