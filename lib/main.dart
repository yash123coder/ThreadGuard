import 'package:flutter/material.dart';
// import 'package:myapp/screens/forget_password.dart';
// import '../../threadguard/home_screen.dart';
// import 'package:myapp/screens/login_screen.dart';
// import 'package:myapp/screens/signup_screen.dart';
import 'package:myapp/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      // home: BottomNavigationScreen(),
      // routes: {
      //   // '/homescreen': (context) => HomeScreen(),
      // },
    );
  }
}
