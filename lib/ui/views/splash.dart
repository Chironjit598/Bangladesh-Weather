import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/ui/views/main_home.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Lottie.asset("assets/files/splash.json"),
        nextScreen: MainHome(),
        splashIconSize: 440.sp,
        duration: 3000,
        splashTransition: SplashTransition.scaleTransition,

        animationDuration: Duration(milliseconds: 500),
      ),
    );
  }
}
