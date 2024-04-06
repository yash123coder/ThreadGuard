import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/const/color.dart';
import 'package:myapp/screens/login%20sigup%20screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isScanning = false;
  String scanResult = ""; //  variable to store the scan result
  bool status = false;
  void startScanning() {
    setState(() {
      isScanning = true;
    });

    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        scanResult =
            "Scan completed! (Replace with the result)"; // Update scan result
        isScanning = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadNotificationStatus();
  }

  Future<void> loadNotificationStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      status = prefs.getBool('notification_status') ?? false;
    });
  }

  Future<void> saveNotificationStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      status = value;
    });
    prefs.setBool('notification_status', value);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: const AssetImage('assets/images/bg1.jpg'),
          //     fit: BoxFit.fill, // Use BoxFit.fill to cover the full screen
          //     colorFilter: ColorFilter.mode(
          //       Colors.black.withOpacity(0.5), // Add opacity to the image
          //       BlendMode.srcOver,
          //     ),
          //   ),
          // ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/security.png',
                          ),
                          width: 125,
                        ),
                        Text(
                          'ThreatGuard',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Abril Fatface',
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        startScanning();
                      },
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 50),
                          width: 200,
                          height: 200,
                          decoration: isScanning
                              ? const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black26,
                                )
                              : const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                  boxShadow: [
                                      BoxShadow(
                                          color: Colors.black45,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(-4, 4)),
                                      BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(-4, 4)),
                                    ]),
                          child: Center(
                              child: isScanning
                                  ?
                                  //const SpinKitWaveSpinner(
                                  //     // duration: Duration(seconds: 3),
                                  //     waveColor: Colors.white,
                                  //     color: Colors.blue,
                                  //     size: 200.0,
                                  //   )
                                  const SpinKitSpinningLines(
                                      color: Colors.white,
                                      size: 190.0,
                                    )
                                  : const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "SCAN",
                                          style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.white,
                                            fontFamily: 'Abril Fatface',
                                          ),
                                        ),
                                        Text(
                                          " NOW!",
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: Colors.white,
                                            fontFamily: 'Abril Fatface',
                                          ),
                                        ),
                                      ],
                                    )),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Display scan result after scanning is complete
                    isScanning
                        ? const SizedBox()
                        : Text(
                            scanResult,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),

                    const SizedBox(
                      height: 30,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     IconTextButton(
                    //       iconData: Icons.history,
                    //       text: 'History',
                    //       onPressed: () {
                    //         Navigator.pushReplacement(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) => const MyHistoryScreen(),
                    //             ));
                    //       },
                    //     ),
                    //     IconTextButton(
                    //       iconData: Icons.settings,
                    //       text: 'Settings',
                    //       onPressed: () {},
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),

                    Container(
                      width: size.width * 0.85,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 33, 81, 148),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(4, 4)),
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(-4, -4)),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.notification_add_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Notification",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(width: 100),
                            AnimatedContainer(
                              duration: const Duration(microseconds: 1000),
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white),
                                color: status ? Colors.blue : Colors.black,
                              ),
                              child: Stack(
                                children: <Widget>[
                                  AnimatedPositioned(
                                    duration:
                                        const Duration(microseconds: 1000),
                                    curve: Curves.easeIn,
                                    top: 1.5,
                                    left: status ? 35 : 0.0,
                                    right: status ? 0.0 : 35,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          saveNotificationStatus(!status);
                                        });
                                      },
                                      child: AnimatedSwitcher(
                                        duration:
                                            const Duration(microseconds: 1000),
                                        transitionBuilder: (Widget child,
                                            Animation<double> animation) {
                                          return ScaleTransition(
                                              scale: animation, child: child);
                                        },
                                        child: status
                                            ? Icon(Icons.check_circle,
                                                color: Colors.black,
                                                size: 25.0,
                                                key: UniqueKey())
                                            : Icon(Icons.circle_sharp,
                                                color: Colors.white,
                                                size: 25.0,
                                                key: UniqueKey()),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () async {
                          // final SharedPreferences sharedPreferences =
                          //     await SharedPreferences.getInstance();
                          // sharedPreferences.remove('email');
                          FirebaseAuth.instance.signOut().then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          });
                        },
                        child: const Text(
                          'logout',
                          style: TextStyle(color: bg, fontSize: 18),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget IconTextButton({
    required IconData iconData,
    required String text,
    double iconSize = 50.0,
    double fontSize = 22.0,
    // Color? iconColor,
    // Color? textColor,
    VoidCallback? onPressed,
    EdgeInsets padding = const EdgeInsets.all(8.0),
    Color buttonColor = Colors.blue,
    // Color? containerColor,
    // double? containerRadius,
  }) {
    return InkWell(
      onHover: (isHovering) {
        // Change the color when hovering
        setState(() {
          buttonColor = isHovering ? Colors.black : Colors.blue;
        });
      },
      child: Container(
        width: 125,
        height: 125,
        padding: padding,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 2, 63, 101),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black87,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(1, 1)),
              BoxShadow(
                  color: Colors.black,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(-1, -1)),
            ]),
        // containerColor != null
        //     ? BoxDecoration(
        //         color: containerColor,
        //         borderRadius: BorderRadius.circular(containerRadius ?? 0.0),
        //       )
        //     : null,
        child: Column(
          // mainAxisSize: MainAxisSize.min, // Restrict size to content
          children: [
            Icon(
              iconData,
              size: iconSize,
              color: Colors.white,
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: onPressed,
              child: Text(
                text,
                style: TextStyle(fontSize: fontSize, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


                    // MaterialButton(
                    //     onPressed: () async {
                    //       final SharedPreferences sharedPreferences =
                    //           await SharedPreferences.getInstance();
                    //       sharedPreferences.remove('email');
                    //       Navigator.pushReplacement(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => LoginScreen(),
                    //           ));
                    //     },
                    //     child: const Text('logout')),

// bottomNavigationBar: CurvedNavigationBar(
//                 animationDuration: const Duration(milliseconds: 300),
//                 index: _currentIndex,
//                 backgroundColor: bg,
//                 onTap: (index) {
//                   setState(() {
//                     _currentIndex = index;
//                   });

//                 },
//                 items:const [
//                   Icon(Icons.home),
//                   Icon(Icons.history),
//                   Icon(Icons.settings),
//                   Icon(Icons.person),
//                 ]),
