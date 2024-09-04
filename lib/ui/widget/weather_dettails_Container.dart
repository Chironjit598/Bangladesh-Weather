import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/ui/widget/WeatherItemWithOutDigree.dart';
import 'package:weather/ui/widget/max_min_temp_Container.dart';
import 'package:weather/ui/widget/weather_item_widget.dart';
import 'package:weather/ui/widget/wind_speed_widget.dart';

Widget WeatherDettailsContainer({required weatherModel}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaxMinTempContainer(
                    temp: weatherModel?.forecast?.forecastday?[0].day?.maxtempC
                            ?.round()
                            .toString() ??
                        "",
                    text: "সর্বোচ্চ তাপমাত্রা"),
                MaxMinTempContainer(
                    temp: weatherModel?.forecast?.forecastday?[0].day?.mintempC
                            ?.round()
                            .toString() ??
                        "",
                    text: "সর্বনিম্ন তাপমাত্রা"),
              ],
            ),
          ),

          SizedBox(
            height: 20.h,
          ),

          //========অনুভূতিশীল তাপমাত্রা====================

          WeatherItemWidget(
              title: "অনুভূতিশীল তাপমাত্রা",
              value:
                  weatherModel?.current?.feelslikeC?.round().toString() ?? ""),
          //========Wind====================
          WindSpeedWidget(
              title: "বাতাসের গতিপ্রবাহ",
              windDir: "(${weatherModel?.current?.windDir}) ",
              value: "${weatherModel?.current?.windKph} km/h"),

          //========আচমকা এলোমেলো বাতাসের গতিপ্রবাহ====================

          WeatherItemWithOutDigree(
              title: "দমকা বাতাসের গতিপ্রবাহ",
              value: "${weatherModel?.current?.gustKph} km/h"),
          //========বৃষ্টিপাতের পরিমাণ====================

          WeatherItemWithOutDigree(
              title: "বৃষ্টি হওয়ার সম্ভাবনা",
              value:
                  "${weatherModel?.forecast?.forecastday?[0].day?.dailyChanceOfRain} %"),

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

          //========দূরত্বের দৃশ্যমানতা====================

          WeatherItemWithOutDigree(
              title: "দূরত্বের দৃশ্যমানতা",
              value:
                  "${weatherModel?.current?.visKm?.round().toString() ?? ""}km"),
        ],
      ),
    ),
  );
}
