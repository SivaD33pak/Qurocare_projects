import 'package:flutter/material.dart';

class HomeCareAppointmentScreen extends StatelessWidget {
  const HomeCareAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Care Appointment'),
        backgroundColor: const Color(0xFF4A00E0),
      ),
      body: const Center(
        child: Text(
          'Home Care Appointment Page',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
