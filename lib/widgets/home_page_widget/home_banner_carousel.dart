import 'dart:async';
import 'package:flutter/material.dart';

class BannerItemData {
  final String title;
  final String subtitle;
  final String buttonText;
  final String imagePath;
  final IconData fallbackIcon;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const BannerItemData({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.imagePath,
    required this.fallbackIcon,
    required this.backgroundColor,
    this.onTap,
  });
}

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoScrollTimer;

  final List<BannerItemData> _banners = [
    const BannerItemData(
      title: 'TAPAT SA PAG-AARAL?',
      subtitle: 'Subukan ang mabisang pagsasanay ngayong araw!',
      buttonText: 'Magsimula',
      imagePath: 'assets/images/home_banner1.png',
      fallbackIcon: Icons.emoji_events_rounded,
      backgroundColor: Color(0xFFE27B58),
    ),
    const BannerItemData(
      title: 'BALIKAN ANG ARALIN',
      subtitle: 'Suriin ang mga paborito at na-bookmark na paksa!',
      buttonText: 'Tignan',
      imagePath: 'assets/images/home_banner2.png',
      fallbackIcon: Icons.bookmark_added_rounded,
      backgroundColor: Color(0xFF4A7C59),
    ),
    const BannerItemData(
      title: 'PAGSASANAY SA FLASHCARDS',
      subtitle: 'Pabilisin ang pagsaulo gamit ang mga flashcards.',
      buttonText: 'Magsanay',
      imagePath: 'assets/images/home_banner3.png',
      fallbackIcon: Icons.style_rounded,
      backgroundColor: Color(0xFF3B5998),
    ),
    const BannerItemData(
      title: 'BAGONG PAGSUSULIT',
      subtitle: 'Subukan ang iyong kaalaman sa bagong pagsusulit.',
      buttonText: 'Sagutan',
      imagePath: 'assets/images/home_banner4.png',
      fallbackIcon: Icons.quiz_rounded,
      backgroundColor: Color(0xFF8E44AD),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  /// Starts or restarts the 3.5-second auto-scroll timer
  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(milliseconds: 3500), (timer) {
      if (_pageController.hasClients) {
        final int nextIndex = (_currentIndex + 1) % _banners.length;
        _pageController.animateToPage(
          nextIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  /// Manual navigation button actions (resets auto-scroll timer)
  void _nextPage() {
    if (_currentIndex < _banners.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _startAutoScroll();
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _startAutoScroll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 155,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _banners.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final banner = _banners[index];
                  return _buildBannerCard(banner);
                },
              ),
            ),

            // Left Arrow
            if (_currentIndex > 0)
              Positioned(
                left: 8,
                child: GestureDetector(
                  onTap: _previousPage,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.85),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.chevron_left_rounded,
                      size: 20,
                      color: Color(0xFF475569),
                    ),
                  ),
                ),
              ),

            // Right Arrow
            if (_currentIndex < _banners.length - 1)
              Positioned(
                right: 8,
                child: GestureDetector(
                  onTap: _nextPage,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.85),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.chevron_right_rounded,
                      size: 20,
                      color: Color(0xFF475569),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),

        // Page Indicator Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_banners.length, (index) {
            final bool isActive = _currentIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 12 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF1E293B)
                    : const Color(0xFFCBD5E1),
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildBannerCard(BannerItemData banner) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 2),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    decoration: BoxDecoration(
      color: banner.backgroundColor,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: banner.backgroundColor.withValues(alpha: 0.25),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        // Text Details & Action Button
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                banner.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.6,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                banner.subtitle,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.3,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: banner.onTap ?? () {},
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7ED),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        banner.buttonText,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 14,
                        color: Color(0xFF1E293B),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),

        // Illustration Image with Larger Icon Fallback
        Expanded(
          flex: 2,
          child: Image.asset(
            banner.imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 115, // Increased from 90
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                    Icon(
                      banner.fallbackIcon,
                      size: 72, // Increased from 58
                      color: Colors.white.withValues(alpha: 0.95),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
}