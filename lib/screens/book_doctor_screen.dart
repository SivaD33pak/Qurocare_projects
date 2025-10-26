import 'package:flutter/material.dart';

class BookDoctorScreen extends StatelessWidget {
  const BookDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a Doctor'),
      ),
      body: const Center(
        child: Text(
          'Doctor Booking Page',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
