import 'package:flutter/material.dart';

// This is the new screen your button will navigate to.
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        // This adds a visible back arrow
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text(
          'Edit Profile Page Content',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}