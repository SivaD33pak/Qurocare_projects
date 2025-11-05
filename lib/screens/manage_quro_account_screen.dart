import 'package:flutter/material.dart';

class ManageQuroAccountScreen extends StatelessWidget {
  const ManageQuroAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Quro Account'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: const Center(
        child: Text(
          'Manage Quro Account Screen',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}