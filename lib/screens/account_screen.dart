import 'package:flutter/material.dart';
import '../widgets/user_profile_card.dart';
import '../widgets/account_action_button.dart';
import '../widgets/account_option_button.dart';
import '../widgets/account_list_tile.dart';
import 'edit_profile_screen.dart';
import 'help_screen.dart';
import 'inbox_screen.dart';
import 'settings_screen.dart';
import 'my_appointments_screen.dart';
import 'my_health_records_screen.dart';
import 'manage_family_screen.dart';
import 'manage_care_bag_screen.dart';
import 'payment_history_screen.dart';
import 'saved_addresses_screen.dart';
import 'manage_subscription_screen.dart';
import 'manage_quro_account_screen.dart';
import 'privacy_security_screen.dart';
import 'legal_screen.dart';
import 'language_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Account',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // User Profile Card
            UserProfileCard(
              userName: 'John Doe',
              userId: 'QC-5450',
              membership: 'Family member - Premium',
              avatarPath: 'assets/user_avatar.png',
              onViewProfile: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfileScreen()),
                );
              },
            ),
            const SizedBox(height: 24),

            // Action Buttons (Help, Inbox, Settings)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AccountActionButton(
                    title: 'Help',
                    icon: Icons.info_outline,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HelpScreen()));
                    },
                  ),
                  AccountActionButton(
                    title: 'Inbox',
                    icon: Icons.mail_outline,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InboxScreen()));
                    },
                  ),
                  AccountActionButton(
                    title: 'Settings',
                    icon: Icons.settings_outlined,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsScreen()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Account Options Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    (MediaQuery.of(context).size.width / 2 - 24) / 85,
                children: [
                  AccountOptionButton(
                    title: 'My Appointments',
                    icon: Icons.person_outline,
                    iconColor: Colors.purple.shade700,
                    iconBackgroundColor: const Color(0xFFF3E5F5),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MyAppointmentsScreen()));
                    },
                  ),
                  AccountOptionButton(
                    title: 'My Health Records',
                    icon: Icons.favorite_border,
                    iconColor: Colors.red.shade700,
                    iconBackgroundColor: const Color(0xFFFFE0E0),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MyHealthRecordsScreen()));
                    },
                  ),
                  AccountOptionButton(
                    title: 'Manage Family',
                    icon: Icons.people_outline,
                    iconColor: Colors.blue.shade700,
                    iconBackgroundColor: const Color(0xFFE3F2FD),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ManageFamilyScreen()));
                    },
                  ),
                  AccountOptionButton(
                    title: 'Manage Care bag',
                    icon: Icons.medical_services_outlined,
                    iconColor: Colors.red.shade700,
                    iconBackgroundColor: const Color(0xFFFFE0E0),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ManageCareBagScreen()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Payments & Orders Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Payments & Orders',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          // **FIXED: Replaced deprecated withOpacity**
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        AccountListTile(
                          title: 'Payment History',
                          icon: Icons.account_balance_wallet_outlined,
                          iconColor: Colors.blue.shade700,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentHistoryScreen()));
                          },
                        ),
                        const Divider(height: 1, indent: 16, endIndent: 16),
                        AccountListTile(
                          title: 'Saved Addresses',
                          icon: Icons.location_on_outlined,
                          iconColor: Colors.green.shade700,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SavedAddressesScreen()));
                          },
                        ),
                        const Divider(height: 1, indent: 16, endIndent: 16),
                        AccountListTile(
                          title: 'Manage Family Subscription',
                          icon: Icons.people_alt_outlined,
                          iconColor: Colors.purple.shade700,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ManageSubscriptionScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // App Settings Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'App Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          // **FIXED: Replaced deprecated withOpacity**
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        AccountListTile(
                          title: 'Manage Quro account',
                          icon: Icons.person_pin_circle_outlined,
                          iconColor: Colors.blue.shade700,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ManageQuroAccountScreen()));
                          },
                        ),
                        const Divider(height: 1, indent: 16, endIndent: 16),
                        AccountListTile(
                          title: 'Privacy & Security',
                          icon: Icons.shield_outlined,
                          iconColor: Colors.blue.shade700,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PrivacySecurityScreen()));
                          },
                        ),
                        const Divider(height: 1, indent: 16, endIndent: 16),
                        AccountListTile(
                          title: 'Legal',
                          icon: Icons.gavel_outlined,
                          iconColor: Colors.grey.shade700,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LegalScreen()));
                          },
                        ),
                        const Divider(height: 1, indent: 16, endIndent: 16),
                        AccountListTile(
                          title: 'Language',
                          icon: Icons.language_outlined,
                          iconColor: Colors.green.shade700,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LanguageScreen()));
                          },
                        ),
                        const Divider(height: 1, indent: 16, endIndent: 16),
                        // Custom "Log Out" button
                        GestureDetector(
                          onTap: () {
                            _showLogoutDialog(context);
                          },
                          child: Container(
                            color: Colors.transparent, // For hit testing
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 14.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                  size: 26,
                                ),
                                SizedBox(width: 16),
                                Text(
                                  'Log Out',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Add some spacing at the bottom
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  // Log Out Confirmation Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                // **TODO: Add your actual logout logic here**
                // For example:
                // 1. Call your authentication service (Firebase, etc.)
                // 2. Clear user data
                // 3. Navigate to the login screen
                print('User logged out!');
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}