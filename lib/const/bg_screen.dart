import 'package:flutter/material.dart';

class bgScreen extends StatelessWidget {
  const bgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/bg1.jpg'),
          fit: BoxFit.fill, // Use BoxFit.fill to cover the full screen
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5), // Add opacity to the image
            BlendMode.srcOver,
          ),
        ),
      ), 
    );
  }
}