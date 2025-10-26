import 'package:flutter/material.dart';
import '../widgets/sliver_app_bar.dart';
import '../widgets/promo_banner.dart';
import '../widgets/appointment_card.dart';
import '../widgets/service_card.dart';
import '../widgets/care_at_home_card.dart';
import 'in_clinic_appointment_screen.dart';
import 'home_care_appointment_screen.dart';
import 'book_doctor_screen.dart';
import 'book_nurse_screen.dart';
import 'blood_test_screen.dart';
import 'physiotherapy_screen.dart';
import 'qurofit_screen.dart';
import 'quroskin_screen.dart';

// Converted to a StatefulWidget to manage pre-caching
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of all images used on this screen
  final List<String> _imageAssets = [
    'assets/doctor.png',
    'assets/home_care.png',
    'assets/service_doctor.png',
    'assets/service_nurse.png',
    'assets/service_blood_test.png',
    'assets/service_physio.png',
    'assets/home_doctor.PNG',
    'assets/home_nurse.png',
    'assets/qurofit.png',
    'assets/quroskin.png',
    'assets/quromotto.png', // Added new motto image for pre-caching
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pre-cache all the images
    for (final asset in _imageAssets) {
      precacheImage(AssetImage(asset), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          // Promo Banner
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: PromoBanner(),
            ),
          ),
          // Appointment Cards Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppointmentCard(
                    title: 'In-Clinic',
                    subtitle: 'Appointment',
                    imagePath: 'assets/doctor.png',
                    gradientColors: const [Color(0xFF6A1B9A), Color(0xFF4A148C)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InClinicAppointmentScreen()),
                      );
                    },
                  ),
                  AppointmentCard(
                    title: 'Home Care',
                    subtitle: 'Appointment',
                    imagePath: 'assets/home_care.png',
                    gradientColors: const [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeCareAppointmentScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Suggestions Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Suggestions Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Suggestions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF6A1B9A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Grid of Service Cards
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                    children: [
                      ServiceCard(
                        title: 'Book Doctor',
                        imagePath: 'assets/service_doctor.png',
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => const BookDoctorScreen()));
                        },
                      ),
                      ServiceCard(
                        title: 'Book Nurse',
                        imagePath: 'assets/service_nurse.png',
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => const BookNurseScreen()));
                        },
                      ),
                      ServiceCard(
                        title: 'Blood Test',
                        imagePath: 'assets/service_blood_test.png',
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => const BloodTestScreen()));
                        },
                      ),
                      ServiceCard(
                        title: 'Physiotherapy',
                        imagePath: 'assets/service_physio.png',
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => const PhysiotherapyScreen()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // "Care begins at home" Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Care begins at home',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 210,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        CareAtHomeCard(
                          title: 'Book doctor',
                          subtitle: 'Expert Care, At your door',
                          imagePath: 'assets/home_doctor.PNG',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BookDoctorScreen()));
                          },
                        ),
                        CareAtHomeCard(
                          title: 'Book Nurse',
                          subtitle: 'Healing Delivered, Comfort Ensured',
                          imagePath: 'assets/home_nurse.png',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BookNurseScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // "For your Everyday care" Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'For your Everyday care',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 210,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        CareAtHomeCard(
                          title: 'QuroFit',
                          subtitle: 'Your journey to a stronger you.',
                          imagePath: 'assets/qurofit.png',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const QuroFitScreen()));
                          },
                        ),
                        CareAtHomeCard(
                          title: 'QuroSkin',
                          subtitle: 'Glow with confidence.',
                          imagePath: 'assets/quroskin.png',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const QuroSkinScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // **NEW: Decorative Motto Image at the bottom**
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
              child: Image.asset('assets/quromotto.png'),
            ),
          ),
          // **NEW: Bottom padding to prevent overlap with floating nav bar**
          const SliverToBoxAdapter(
            child: SizedBox(height: 120), // Adjust this height as needed
          )
        ],
      ),
    );
  }
}

