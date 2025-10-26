import 'dart:async';
import 'package:flutter/material.dart';

// Data model for our promo card content
class PromoCardData {
  final String title;
  final String subtitle;
  final String tagline;
  final List<Color> gradientColors;
  final String? imageAsset; // Path to the image asset
  final double? imageHeight; // For adjustable image size

  PromoCardData({
    required this.title,
    required this.subtitle,
    required this.tagline,
    required this.gradientColors,
    this.imageAsset, // Make it optional
    this.imageHeight, // Make it optional
  });
}

class PromoBanner extends StatefulWidget {
  const PromoBanner({super.key});

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  // Centralized list of data. To change banners, just edit this list!
  late final List<PromoCardData> promoData;

  @override
  void initState() {
    super.initState();
    // Initialize promoData here
    promoData = [
      PromoCardData(
        title: 'Qurocare Family',
        subtitle: '@2499/Year',
        tagline: 'Protect your closed ones!',
        gradientColors: [const Color(0xFF4A148C), const Color(0xFF6A1B9A)],
        imageAsset: 'assets/family.png', // Ensure this image exists in assets
        imageHeight: 120, // Adjust the height of the image here
      ),
      PromoCardData(
        title: 'Individual Plan',
        subtitle: '@1499/Year',
        tagline: 'Personalized care just for you.',
        gradientColors: [const Color(0xFF0D47A1), const Color(0xFF1976D2)],
        imageAsset: 'assets/individual.png',
        imageHeight: 100,
      ),
      PromoCardData(
        title: 'Corporate Wellness',
        subtitle: 'Contact Us',
        tagline: 'Healthy team is a happy team.',
        gradientColors: [const Color(0xFF004D40), const Color(0xFF00796B)],
        // This card has no image
      ),
    ];

    if (promoData.isNotEmpty) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      int nextPage = _currentPage + 1;
      if (nextPage >= promoData.length) {
        nextPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (promoData.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: promoData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
              _resetTimer();
            },
            itemBuilder: (context, index) {
              return _buildPromoCard(promoData[index]);
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(promoData.length, (index) => _buildDot(index: index)),
        ),
      ],
    );
  }

  Widget _buildPromoCard(PromoCardData data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: data.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // 1. Positioned text content on the RIGHT
              Positioned(
                right: 12, // reduced horizontal inset
                top: 12, // reduced top inset
                bottom: 12, // reduced bottom inset to give more space
                width: MediaQuery.of(context).size.width * 0.48,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '@unlimitedbenefits',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        '${data.title}\n${data.subtitle}',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 1),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        data.tagline,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    //const SizedBox(height: 8),
                    // Constrain the button size so it cannot grow vertically
                    SizedBox(
                      width: 130,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF6A1B9A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        child: const Text('Join now'),
                      ),
                    ),
                  ],
                ),
              ),
              // 2. Positioned image on the bottom LEFT
              if (data.imageAsset != null)
                Positioned(
                  left: 8,
                  bottom: 0, // avoid negative offset which can cause overflow
                  child: Image.asset(
                    data.imageAsset!,
                    height: data.imageHeight,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        height: data.imageHeight,
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.white30,
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? const Color(0xFF4A148C) : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

