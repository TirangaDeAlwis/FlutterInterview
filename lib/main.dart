import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiranga_alwis_flutter_interview/screens/splash_screen.dart';

void main() {
  // Set the status bar color to transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // Set the status bar color to transparent
      statusBarIconBrightness:
      Brightness.dark, // Set the status bar icons to dark color
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shopping',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
