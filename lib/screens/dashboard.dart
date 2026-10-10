import 'package:flutter/material.dart';

class ActivityDashboardScreen extends StatefulWidget {
  const ActivityDashboardScreen({super.key});

  @override
  State<ActivityDashboardScreen> createState() =>
      _ActivityDashboardScreenState();
}

class _ActivityDashboardScreenState extends State<ActivityDashboardScreen> {
  int _currentBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE), 
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. APP BAR HEADER (Pure Logo Image Asset + Profile Avatar Image Asset)
              _buildHeader(),
              const SizedBox(height: 20),

              // 2. GREETING TITLE
              const Text(
                'Magandang araw!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 16),

              // 3. PROGRESS CARD
              _buildProgressCard(),
              const SizedBox(height: 24),

              // 4. SECTION TITLE
              const Text(
                'Mga Aralin ngayon',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 16),

              // 5. GRID CARDS
              _buildLessonGrid(),
              const SizedBox(height: 20),

              // 6. STREAK & STARS BAR
              _buildStreakBar(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // 7. BOTTOM NAVIGATION BAR
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // WikAp Logo Image
        Image.asset(
          'assets/images/logo.png',
          height: 38,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              const SizedBox(height: 38, width: 100),
        ),

        // Profile Avatar Image
        ClipOval(
          child: Image.asset(
            'assets/vectors/profile_avatar.png',
            width: 36,
            height: 36,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const SizedBox(width: 36, height: 36),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ang Iyong Progreso',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Araling Panlipunan',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: const LinearProgressIndicator(
                    value: 0.65,
                    minHeight: 10,
                    backgroundColor: Color(0xFFFFEDD5),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF1E293B),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '65%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Medal Image Asset
          Image.asset(
            'assets/images/dash_progress.png',
            width: 70,
            height: 70,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const SizedBox(width: 70, height: 70),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildLessonCard(
                title: 'Flashcards',
                imagePath: 'assets/images/flashcard.png',
                badgeColor: const Color.fromARGB(255, 0, 182, 45),
                onTap: () {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildLessonCard(
                title: 'Pagsusulit',
                imagePath: 'assets/images/quizes.png',
                badgeColor: const Color(0xFF64748B),
                onTap: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildLessonCard(
                title: 'Mga Tala',
                imagePath: 'assets/images/handout.png',
                badgeColor: const Color(0xFF64748B),
                onTap: () {},
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _buildLessonCard({
    required String title,
    required String imagePath,
    required Color badgeColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    width: 48,
                    height: 48,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(width: 48, height: 48),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Streak: ',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: '5 araw 🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: Color(0xFFCBD5E1),
              shape: BoxShape.circle,
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'Mga Bituin: ',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: '120 ⭐',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.withValues(alpha: 0.15),
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
      currentIndex: _currentBottomNavIndex,
      onTap: (index) {
        setState(() {
          _currentBottomNavIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF1E293B),
      unselectedItemColor: const Color(0xFF94A3B8),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/vectors/home.png',
            width: 24,
            height: 24,
            fit: BoxFit.contain,
            color: _currentBottomNavIndex == 0
                ? const Color(0xFF1E293B)
                : const Color(0xFF94A3B8),
            colorBlendMode: BlendMode.srcIn,
            errorBuilder: (context, error, stackTrace) =>
                const SizedBox(width: 24, height: 24),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/vectors/open-book.png',
            width: 24,
            height: 24,
            fit: BoxFit.contain,
            color: _currentBottomNavIndex == 1
                ? const Color(0xFF1E293B)
                : const Color(0xFF94A3B8),
            colorBlendMode: BlendMode.srcIn,
            errorBuilder: (context, error, stackTrace) =>
                const SizedBox(width: 24, height: 24),
          ),
          label: 'Mga Aralin',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/vectors/flashcard.png',
            width: 24,
            height: 24,
            fit: BoxFit.contain,
            color: _currentBottomNavIndex == 2
                ? const Color(0xFF1E293B)
                : const Color(0xFF94A3B8),
            colorBlendMode: BlendMode.srcIn,
            errorBuilder: (context, error, stackTrace) =>
                const SizedBox(width: 24, height: 24),
          ),
          label: 'Mga Flashcard',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/vectors/user.png',
            width: 24,
            height: 24,
            fit: BoxFit.contain,
            color: _currentBottomNavIndex == 3
                ? const Color(0xFF1E293B)
                : const Color(0xFF94A3B8),
            colorBlendMode: BlendMode.srcIn,
            errorBuilder: (context, error, stackTrace) =>
                const SizedBox(width: 24, height: 24),
          ),
          label: 'Profile',
        ),
      ],
    ),
    );
  }
}