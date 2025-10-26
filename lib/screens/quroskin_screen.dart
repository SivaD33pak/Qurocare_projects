import 'package:flutter/material.dart';

class QuroSkinScreen extends StatelessWidget {
  const QuroSkinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuroSkin'),
      ),
      body: const Center(
        child: Text(
          'QuroSkin Page',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
