import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/ui/views/hour_by_weather.dart';
import 'package:weather/ui/views/three_days_weather.dart';
import 'package:weather/ui/views/weatherDettailsScreen.dart';
import 'package:weather/ui/views/yesterdayWeather.dart';
import 'package:weather/ui/widget/customButton.dart';

import 'package:weather/ui/widget/last_update_container.dart';
import 'package:weather/ui/widget/location_time_Container.dart';
import 'package:weather/ui/widget/sun_moonAnd_calcious_container.dart';
import 'package:weather/ui/widget/sun_moon_row.dart';
import 'package:weather/ui/widget/weather_dettails_Container.dart';

class Weather extends StatefulWidget {
  final WeatherModel? weatherModel;
  const Weather({super.key, required this.weatherModel});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  //================banner ads start================

  final BannerAd bannerAd = BannerAd(
    size: AdSize(width: 300, height: 50),
    request: AdRequest(),
    adUnitId: "ca-app-pub-4658221067173714/4293905903",
    // adUnitId: "ca-app-pub-3940256099942544/6300978111",
    listener: BannerAdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (ad) {},
      // Called when an ad request failed.
      onAdFailedToLoad: (ad, err) {
        ad.dispose();
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) {},
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) {},
      // Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) {},
    ),
  );

  //================banner ads end================



  @override
  void initState() {
    bannerAd.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
            weatherType: WeatherType.sunnyNight,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height),
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //======location and time================

                      LoccationAndTimeContainer(
                        location: widget.weatherModel?.location?.name ?? "",
                        date: widget.weatherModel?.current?.lastUpdated
                                .toString() ??
                            "",
                      ),

                      SizedBox(
                        height: 70.h,
                      ),

                      //=======sun, moon, and temparature Row==============

                      SunMoonAndTamparaturContainer(
                          img:
                              "https:${widget.weatherModel?.current?.condition?.icon ?? ""}",
                          temp: widget.weatherModel?.current?.tempC
                                  ?.round()
                                  .toString() ??
                              "",
                          text: widget.weatherModel?.current?.condition?.text ??
                              ""),

                      //=======Last Update Container==============

                      LastUpdateContainer(
                          time:
                              widget.weatherModel?.current?.lastUpdated ?? ""),

                      //=======Weather Dettails Container==============

                      WeatherDettailsContainer(
                          weatherModel: widget.weatherModel),

                      //=========Dettails Button==============

                      CustomButton(
                          title: "বিস্তারিত দেখুন",
                          page: () => WeatherDettailsScreen(
                              weatherModel: widget.weatherModel)),

                      //====================Sun Moon Category Start====================================

                      SunMoonWidget(weatherModel: widget.weatherModel),
                      SizedBox(
                        height: 15.h,
                      ),
                      //================== প্রতি ঘণ্টার আবহাওয়া"==========================

                      CustomButton(
                          title: "প্রতি ঘণ্টার আবহাওয়া",
                          page: () =>
                              HourByWeather(weatherModel: widget.weatherModel)),

                      SizedBox(
                        height: 5.h,
                      ),

                      //================== আগামীকালের আবহাওয়া==========================
                      CustomButton(
                          title: "আগামীকালের আবহাওয়া",
                          page: () => YeasterDayWeather(
                              weatherModel: widget.weatherModel)),
                      SizedBox(
                        height: 5.h,
                      ),

                      //================== আগামী তিনদিনের আবহাওয়া==========================
                      CustomButton(
                          title: "আগামী তিনদিনের আবহাওয়া",
                          page: () => ThreeDaysWeather(
                              weatherModel: widget.weatherModel)),
                    ],
                  ),
                ),
              ),
              
              
              Padding(
                padding: EdgeInsets.only(
                  top: 5.h,
                  bottom: 5.h,
                ),
                child: Container(
                  height: 60.h,
                  width: double.infinity,
                  child: AdWidget(ad: bannerAd),
                ),
              ),
            
            
            ],
          ),
        )
      ],
    );
  }
}
