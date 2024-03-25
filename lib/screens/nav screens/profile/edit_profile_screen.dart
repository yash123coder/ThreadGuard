import 'package:flutter/material.dart';
import 'package:myapp/const/color.dart';
import 'package:myapp/screens/nav%20screens/profile/user_profile.dart';

class EditProfileScreen extends StatefulWidget {
  final UserProfile userProfile;

  EditProfileScreen({required this.userProfile});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController; // New

  @override
  void initState() {
    super.initState();
    _usernameController =
        TextEditingController(text: widget.userProfile.username);
    _emailController = TextEditingController(text: widget.userProfile.email);
    _passwordController = TextEditingController(); // New
  }

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: bg,
        title: const Text(
          'Edit Profile',
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
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle:
                    TextStyle(color: Colors.white), // Set label text color
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white), // Set border color
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle:
                    TextStyle(color: Colors.white), // Set label text color
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white), // Set border color
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: const TextStyle(
                    color: Colors.white), // Set label text color
                enabledBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white), // Set border color
                ),
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
              // obscureText: true,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save changes and update profile
                String newUsername = _usernameController.text;
                String newEmail = _emailController.text;
                String newPassword = _passwordController.text; // New

                // we have to call a function to update the profile in the database
                print('Updated Username: $newUsername');
                print('Updated Email: $newEmail');
                print('Updated Password: $newPassword'); // New

                // Navigate back to profile screen
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
