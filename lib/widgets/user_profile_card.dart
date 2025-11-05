import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String userName;
  final String userId;
  final String membership;
  final String? avatarPath;
  final VoidCallback onViewProfile;

  const UserProfileCard({
    super.key,
    required this.userName,
    required this.userId,
    required this.membership,
    this.avatarPath,
    required this.onViewProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170, // Total height of the widget
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          // Main content card
          Container(
            height: 150, // Height of the main card
            margin: const EdgeInsets.only(top: 20), // Top margin to make space for avatar
            padding: const EdgeInsets.only(left: 140, right: 16), // Padding to avoid avatar
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Color(0xFF4A148C), Color(0xFF6A1B9A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name
                Row(
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '👑', // Crown emoji
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // User ID
                Text(
                  'ID: $userId',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                // Membership Status
                Text(
                  membership,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                // View Profile Button
                GestureDetector(
                  onTap: onViewProfile,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View & Edit Profile',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white.withOpacity(0.9),
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Avatar Image
          Positioned(
            top: 0,
            left: 16,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 56,
                backgroundImage: avatarPath != null
                    ? AssetImage(avatarPath!)
                    : null,
                // Fallback icon if no image is provided
                child: avatarPath == null
                    ? const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}