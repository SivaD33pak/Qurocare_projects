import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      expandedHeight: 50,
      elevation: 0,
      pinned: true,
      floating: true,
      centerTitle: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // A simple representation of the logo
          const SizedBox(width: 8),
          Image.asset('assets/qlogo.png',width: 50,height: 50,),
          const SizedBox(width: 10),
          Image.asset('assets/qlogoname.png',width: 150,height: 70,),
        ],
      ),
      actions: [
        // Search Icon
        IconButton(
          icon: const Icon(Icons.search, color: Color(0xFF2D3748), size: 28),
          onPressed: () {
            // Handle search action
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
