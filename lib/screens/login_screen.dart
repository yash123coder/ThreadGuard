import 'package:flutter/material.dart';
import 'package:myapp/components/google_login.dart';
// import 'package:flutter_glow/flutter_glow.dart';
import 'package:myapp/const/color.dart';
import 'package:myapp/screens/home_screen.dart';
// import '../../../threadguard/home_screen.dart';
import 'package:myapp/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'forget_password.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  bool _isPasswordVisible = false;

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
            body: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/security.png'),

                        SizedBox(
                          height: size.height * 0.01,
                        ),

                        Text(
                          "Welcome Back!",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Username/Email',
                            labelStyle: TextStyle(color: Colors.white70),
                            prefixIcon:
                                Icon(Icons.email, color: Colors.white70),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email or username';
                            }
                            if (!RegExp(
                                    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white70),
                            prefixIcon: Icon(Icons.lock, color: Colors.white70),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              child: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        // SizedBox(height: 7),
                        TextButton(
                          onPressed: () {
                            // Navigate to forget password screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPasswordScreen(),
                              ),
                            );
                          },
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.blue.shade300),
                              )),
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: _loading ? null : _submit,
                              // onPressed: () async {
                              //   if (_emailController.text.isEmpty ||
                              //       _passwordController.text.isEmpty) {
                              //     // Display an error message or show a Snackbar indicating empty fields
                              //     // You can replace this with your own error handling logic
                              //     print(
                              //         "Please fill in both email and password");
                              //   } else {
                              //     // final SharedPreferences sharedPreferences =
                              //     //     await SharedPreferences.getInstance();
                              //     // sharedPreferences.setString(
                              //     //     'email', _emailController.text);
                              //     // Navigator.pushReplacement(
                              //     //     context,
                              //     //     MaterialPageRoute(
                              //     //       builder: (context) => HomeScreen(),
                              //     //     )
                              //     //     );
                              //   }
                              // },
                              child: _loading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'Login',
                                      style: TextStyle(color: bg, fontSize: 18),
                                    ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'or continue with',
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 25,
                        ),

                        GoogleSignInButton(onPressed: () {}),
                        // ElevatedButton(
                        //     onPressed: () {},
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Image.asset(
                        //           'assets/images/google.png',
                        //           height: 30,
                        //         ),
                        //         Text(
                        //           'Log in with Google',
                        //           style: TextStyle(color: bg, fontSize: 18),
                        //         ),
                        //       ],
                        //     )),

                        SizedBox(height: 25),
                        TextButton(
                          onPressed: () {
                            // Navigate to signup screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'New user?',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                ' Sign Up',
                                style: TextStyle(color: Colors.blue.shade300),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Simulate login process
      setState(() {
        _loading = true;
      });

      // Replace the following lines with your actual login logic
      Future.delayed(Duration(seconds: 2), () async {
        setState(() {
          _loading = false;
        });

        // If login is successful, navigate to home screen
        // Replace the pushReplacement with your actual navigation logic
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('email', _emailController.text);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      });
    }
  }
}
