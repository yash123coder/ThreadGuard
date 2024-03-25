import 'package:flutter/material.dart';
import 'package:myapp/components/theme/heme.dart';
import 'package:myapp/screens/nav%20screens/mainscreen.dart';
// import 'package:myapp/screens/nav%20screens/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageDecorator(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Splash Screen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: SplashScreen(),
        home:  const MainScreen(),
      ),
    );
  }
}
