import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children:  [
        //list of object of jokes in javascript
         Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Icon(
                Icons.settings,
                size: 100,
                color: Colors.white10,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
