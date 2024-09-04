import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/ui/views/bottomnavigationPages/faq.dart';
import 'package:weather/ui/views/bottomnavigationPages/weatherScreen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
//-====bottomNavigationbar code start==========
  int _currentIndex=0;

  final _pages=[
    WeatherScreen(),
     FaqScreen(),

  ];


  //-====bottomNavigationbar code end==========



  
  //For Exit Dialouge start
  Future _exitDialoge(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("আপনি কি অ্যাপ থেকে বের হতে চান ?"),
            content: Row(
              children: [
                TextButton(onPressed: () => Navigator.pop(context), child: Text("না")),
                TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: Text("হ্যাঁ")),
              ],
            ),
          );
        });


  }

  //For Exit Dialouge End



  
  @override
  void initState() {
    //==============forground notifications==============
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.title.toString());
      }
    });

    //==============background notifications==============
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification != null) {
        Navigator.pushNamed(context, message.data['path']);
      }
    });
    //==============terminent notifications==============

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        Navigator.pushNamed(context, message.data['path']);
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
        _exitDialoge(context);
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavyBar(
            containerHeight: 70.h,
              iconSize: 37.sp,
            backgroundColor: const Color(0xFF000a3f) ,
            selectedIndex: _currentIndex,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  showElevation: true,
                  itemCornerRadius: 24.r,
                  curve: Curves.easeIn,
          
            onItemSelected: (value){
              setState(() {
                _currentIndex=value;
              });
      
            },
              items: [
                 BottomNavyBarItem(
                        icon: const Icon(Icons.home_outlined), title: const Text("হোম")),
                    BottomNavyBarItem(
                        icon: const Icon(Icons.question_answer_outlined),
                        title: const Text("FAQ")),
              ]
            ),
      
            body: _pages[_currentIndex],
         
        ),
      ),
    );
  }
}