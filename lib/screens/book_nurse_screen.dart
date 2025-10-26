import 'package:flutter/material.dart';

class BookNurseScreen extends StatelessWidget {
  const BookNurseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a Nurse'),
      ),
      body: const Center(
        child: Text(
          'Nurse Booking Page',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
