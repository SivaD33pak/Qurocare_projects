import 'package:flutter/material.dart';

class MyHealthRecordsScreen extends StatelessWidget {
  const MyHealthRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Health Records',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text(
          'My Health Records Content',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}