import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:launch_review/launch_review.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/apiServicess.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/ui/views/bottomnavigationPages/faq.dart';
import 'package:weather/ui/views/drawer_pages/about_app.dart';
import 'package:weather/ui/views/drawer_pages/how_to_use.dart';
import 'package:weather/ui/views/weather.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  ApiServices apiServices = ApiServices();
  String district = "Dhaka";

  //======All District list for dropdown menu bar========
  List<String> allDistirct = [
    "Bandarban",
    "Brahmanbaria",
    "Baorguna Barisal",
    "Barisal",
    "Bhola",
    "Bagerhat",
    "Bogra BD",
    "Chandpur",
    "Chittagong",
    "Comilla BD",
    "Cox's Bazar",
    "Chuadanga Khulna",
    "Chapai Nawabganj",
    "Dhaka",
    "Dinajpur",
    "Feni",
    "Faridpur",
    "Gazipur",
    "Gopalganj",
    "Gaibandha Rangpur",
    "Habiganj",
    "Jhalokati Barisal",
    "Jhenaidah Khulna",
    "Jamalpur",
    "Jessore",
    "Joypurhat Rajshahi",
    "Khagrachhari",
    "Kishoreganj",
    "Khulna",
    "Kushtia",
    "Kurigram Rangpur",
    "Lalmonirhat",
    "Lakshmipur",
    "Madaripur",
    "Manikganj",
    "Munshiganj",
    "Magura",
    "Meherpur Khulna",
    "Mymensingh",
    "Moulvibazar Sylhet",
    "Netrokona Mymensingh",
    "Narail",
    "Naogaon",
    "Natore Rajshahi",
    "Noakhali",
    "Nilphamari Rangpur",
    "Narayanganj",
    "Narsingdi",
    "Patuakhali",
    "Pirojpur",
    "Panchagarh",
    "Pabna",
    "Rangamati",
    "Rajbari",
    "Rajshahi",
    "Rangpur",
    "Shariatpur Dhaka",
    "Satkhira",
    "Sherpur",
    "Sunamganj",
    "Sylhet",
    "Sirajganj",
    "Tangail",
    "Thakurgaon",
  ];

   
  Future<void> _saveSelectedValue(String values) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {});
    await prefs.setString('selectedValue', values);
  }

  @override
  void initState() {
    super.initState();

    _loadSelectedValue();
  
  }

  Future<void> _loadSelectedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedValue = prefs.getString('selectedValue');
    if (selectedValue != null) {
      setState(() {
        district = selectedValue;
      });
    }
  }


    //===========search box code start======================

  shoeTextInputDialouge() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Search Your location"),
            content: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingvalue) {
                if (textEditingvalue.text == "") {
                  return const Iterable<String>.empty();
                } else {
                  List<String> matches = <String>[];
                  matches.addAll(allDistirct);
                  matches.retainWhere((s) {
                    return s
                        .toLowerCase()
                        .contains(textEditingvalue.text.toLowerCase());
                  });
                  return matches;
                }
              },
              onSelected: (String value) {
                district = value;
                Navigator.pop(context);
                setState(() {});
              },
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ok")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Stack(
                  children: [
                    WeatherBg(
                        weatherType: WeatherType.sunnyNight,
                        width: 370.w,
                        height: 190.h),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.white24,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              " প্রযুক্তি আমাদের শিক্ষার ডানা হতে পারে যা বিশ্বকে আরো দ্রুত এগিয়ে নিয়ে যেতে পারবে...",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            ListTile(
              leading: Icon(Icons.question_answer_outlined),
              title: Text("প্রশ্ন ও উত্তর"),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => FaqScreen())),
            ),

            ListTile(
              leading: Icon(Icons.rate_review_outlined),
              title: Text("রিভিউ দিন"),
              onTap: () => LaunchReview.launch(
                androidAppId: "com.chironjit_roy.bangladesh_weather",
              ),
            ),
            // ListTile(
            //   leading: Icon(Icons.share_rounded),
            //   title: Text("শেয়ার"),
            //   onTap: () => Share.share(
            //       "https://play.google.com/store/apps/details?id=com.chironjit_roy.bangladesh_weather"),
            // ),

            ListTile(
              leading: Icon(Icons.help_outlined),
              title: Text("কিভাবে ব্যাবহার করব"),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HowToUse())),
            ),
            ListTile(
              leading: Icon(Icons.apps_outage_outlined),
              title: Text("অ্যাপ সম্পর্কে"),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AboutApp())),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app_outlined),
              title: Text("বেরিয়ে  যান "),
              onTap: () => SystemNavigator.pop(),
            ),
          ],
        ),
      ),
      appBar: AppBar(
         actions: [
          IconButton(
              onPressed: () async {
                await shoeTextInputDialouge();

                setState(() {});
              },
              icon: Icon(Icons.search_outlined)),
        ],
        backgroundColor: Color.fromARGB(255, 1, 1, 75),
         title: DropdownButton(
            dropdownColor: Color.fromARGB(255, 1, 1, 75),
            alignment: Alignment.topRight,
            iconSize: 45.sp,
            underline: Container(),
            iconEnabledColor: Colors.white,
            elevation: 3,
            menuMaxHeight: 600.h,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            value: district,
            items: allDistirct.map((String value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (newValue) async {
              setState(() {
                district = newValue!;
                _saveSelectedValue(district.toString());
              });
              // await data.add(district);
            }),
       
      ),
     
     
     
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WeatherModel? weatherModel = snapshot.data;
            return Weather(weatherModel: weatherModel);
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error has occured"),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: apiServices.getWeatherData(district.toString()),
      ),
    );
  }
}
