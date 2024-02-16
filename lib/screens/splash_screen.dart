import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:myapp/const/color.dart';
import 'package:myapp/screens/home_screen.dart';
// import '../../../threadguard/home_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  String? finalEmail;

  Future getvalidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail!;
    });
    print(finalEmail);
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();

    // Navigate to the next screen after 5 seconds
    getvalidationData().whenComplete(() async {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                finalEmail == null ? LoginScreen() : HomeScreen(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg1.jpg'),
              fit: BoxFit.fill, // Use BoxFit.fill to cover the full screen
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), // Add opacity to the image
                BlendMode.srcOver,
              ),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            // backgroundColor: bg,
            body: Center(
              child: FadeTransition(
                opacity: _fadeInAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlowIcon(Icons.security, color: Colors.white),
                        SizedBox(
                          width: 2,
                        ),
                        GlowText(
                          'ThreadGuard',
                          style: TextStyle(
                              fontSize: 24.0,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    GlowText(
                      'Protect your',
                      style: TextStyle(
                          fontSize: 34.0,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    GlowText(
                      'personal data',
                      style: TextStyle(
                          fontSize: 28.0,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 16.0),
                    // CircularProgressIndicator(),
                    Image.asset(
                      'assets/images/splashbg.png',
                      // height: size.height * 0.685,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
