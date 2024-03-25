import 'package:flutter/material.dart';
import 'package:myapp/const/color.dart';
import 'package:myapp/screens/nav%20screens/profile/edit_profile_screen.dart';
import 'package:myapp/screens/nav%20screens/profile/user_profile.dart';

class MyProfileScreen extends StatelessWidget {
  final UserProfile userProfile;

  MyProfileScreen({required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: bg,
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontFamily: 'Abril Fatface',
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(userProfile.profilePhotoUrl),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userProfile.username,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                   Text(
                    userProfile.email,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditProfileScreen(userProfile: userProfile)),
                      );
                    },
                    child: const Text('Edit Profile'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
