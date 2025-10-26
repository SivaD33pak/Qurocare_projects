import 'package:flutter/material.dart';

class QuroFitScreen extends StatelessWidget {
  const QuroFitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuroFit'),
      ),
      body: const Center(
        child: Text(
          'QuroFit Page',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
