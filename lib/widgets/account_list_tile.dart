import 'package:flutter/material.dart';

class AccountListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor; // Added this line
  final VoidCallback onTap;

  const AccountListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor, // Added this line
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent, // For hit testing
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor, // Use the variable here
              size: 26,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF1E293B),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}