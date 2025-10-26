import 'package:flutter/material.dart';

class InClinicAppointmentScreen extends StatelessWidget {
  const InClinicAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('In-Clinic Appointment'),
        backgroundColor: const Color(0xFF6A1B9A),
      ),
      body: const Center(
        child: Text(
          'In-Clinic Appointment Page',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
