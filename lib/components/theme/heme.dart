import 'package:flutter/material.dart';

class BackgroundImageDecorator extends StatelessWidget {
  final Widget child;

  const BackgroundImageDecorator({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/bg1.jpg'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: child,
    );
  }
}
