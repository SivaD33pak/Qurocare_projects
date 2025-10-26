import 'package:flutter/material.dart';

class BloodTestScreen extends StatelessWidget {
  const BloodTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a Blood Test'),
      ),
      body: const Center(
        child: Text(
          'Blood Test Booking Page',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
