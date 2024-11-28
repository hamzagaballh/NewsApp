import 'package:flutter/material.dart';
import 'package:flutter_application_3/pressentation/screens/home/home.dart';
import 'package:flutter_application_3/pressentation/screens/splash/splash.dart';



void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}