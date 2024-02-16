import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myapp/const/color.dart';
import 'package:myapp/screens/history_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/profile_screen.dart';
import 'package:myapp/screens/setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
   const MyHistoryScreen(),
   const SettingsScreen(),
    const PersonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:const  AssetImage('assets/images/bg1.jpg'),
              fit: BoxFit.fill, // Use BoxFit.fill to cover the full screen
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), // Add opacity to the image
                BlendMode.srcOver,
              ),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),

            // _pages[_currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
                animationDuration: const Duration(milliseconds: 300),
                index: _currentIndex,
                backgroundColor: bg,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                 
                },
                items:const [
                  Icon(Icons.home),
                  Icon(Icons.history),
                  Icon(Icons.settings),
                  Icon(Icons.person),
                ]),
            // body: Container(
            //   child: Icon(Icons.home),
            // ),
           body: MaterialButton(onPressed: () async {
              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.remove('email');
              Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
            }, child: const Text('logout')),
            // _pages[_currentIndex],
            // bottomNavigationBar: BottomNavigationBar(
            //   backgroundColor: Colors.white,
            //   unselectedItemColor: Colors.black,
            //   selectedItemColor: Colors.black,
            //   currentIndex: _currentIndex,
            //   onTap: (index) {
            //     setState(() {
            //       _currentIndex = index;
            //     });
            //   },
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.home),
            //       label: 'Home',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.security),
            //       label: 'Thread Detection',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.info),
            //       label: 'About Us',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.contacts),
            //       label: 'Contact',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.person),
            //       label: 'User Profile',
            //     ),
            //   ],
            // ),
          ),
        ),
      ],
    );
  }
}
