import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:myapp/components/theme/heme.dart';
import 'package:myapp/screens/nav%20screens/history_screen.dart';
import 'package:myapp/screens/nav%20screens/home_screen.dart';
import 'package:myapp/screens/nav%20screens/profile/profile_screen.dart';
import 'package:myapp/screens/nav%20screens/setting_screen.dart';
import 'package:myapp/screens/nav%20screens/profile/user_profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages =  [
    const HomeScreen(),
    MyHistoryScreen(),
    const SettingsScreen(),
    MyProfileScreen(userProfile: UserProfile(
    username: 'Pratik Jalodkar',
    email: 'pjalo@gmail.com',
    password: 'Password',
    profilePhotoUrl: 'https://example.com/profile.jpg',
  ),)
  ];
  int _currentIndex = 0;

  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImageDecorator(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: const AssetImage('assets/images/bg1.jpg'),
          //     fit: BoxFit.fill,
          //     colorFilter: ColorFilter.mode(
          //       Colors.black.withOpacity(0.5),
          //       BlendMode.srcOver,
          //     ),
          //   ),
          // ),
          child: Scaffold(
              body: pages[_currentIndex],
              backgroundColor: Colors.transparent,
              bottomNavigationBar: CurvedNavigationBar(
                  animationDuration: const Duration(milliseconds: 300),
                  index: _currentIndex,
                  backgroundColor: Colors.transparent,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: const [
                    Icon(Icons.home),
                    Icon(Icons.history),
                    Icon(Icons.settings),
                    Icon(Icons.person),
                  ])),
        ),
      ],
    );
  }
}
