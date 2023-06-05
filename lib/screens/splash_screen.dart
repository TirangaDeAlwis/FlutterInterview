import 'home_screen.dart';
import '../utils/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: Column(
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Lottie.asset('assets/images/splash_image.json'),
          ),
          const SizedBox(height: 30),
          const Text(
            'Flutter Shopping',
            style: TextStyle(
              color: kLightBlue,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      splashIconSize: 400,
      nextScreen: const HomeScreen(),
      backgroundColor: kWhite,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}
