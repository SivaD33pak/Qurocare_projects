import 'package:flutter/material.dart';

class PhysiotherapyScreen extends StatelessWidget {
  const PhysiotherapyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Physiotherapy'),
      ),
      body: const Center(
        child: Text(
          'Physiotherapy Booking Page',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
