import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: "Welcome to\nGigaChad Runner! 💪",
      description: "세상에서 가장 Chad한\n러닝 앱에 오신걸 환영합니다!",
      imagePath: "assets/images/정면차드.jpg",
      backgroundColor: AppColors.charcoalBlack,
    ),
    OnboardingPage(
      title: "Chad Level System 🏆",
      description: "달리는 속도에 따라\nChad 레벨이 실시간으로 변합니다!\n\nUltra Chad부터 Beta Pace까지...",
      imagePath: "assets/images/썬글차드.jpg",
      backgroundColor: AppColors.cardBackground,
    ),
    OnboardingPage(
      title: "Real-time GPS Tracking 🗺️",
      description: "정확한 GPS로 거리와 속도를\n실시간 추적합니다!\n\n진동으로 Chad 레벨 변화를 알려드려요",
      imagePath: "assets/images/커피차드.png",
      backgroundColor: AppColors.charcoalBlack,
    ),
    OnboardingPage(
      title: "Let's Get Chad! 🚀",
      description: "이제 진정한 Chad가 되어\n최고의 러닝을 시작해보세요!\n\n시작하기를 눌러 Chad의 여정을 시작하세요",
      imagePath: "assets/images/눈빔차드.jpg",
      backgroundColor: AppColors.cardBackground,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureBlack,
      body: SafeArea(
        child: Column(
          children: [
            // 상단 Skip 버튼
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'GigaChad Runner',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      color: AppColors.chadGold,
                    ),
                  ),
                  if (_currentPage < _pages.length - 1)
                    TextButton(
                      onPressed: _completeOnboarding,
                      child: Text(
                        'Skip',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 16,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // 페이지뷰
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index]);
                },
              ),
            ),

            // 페이지 인디케이터
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColors.chadGold
                        : AppColors.textTertiary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // 하단 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _currentPage == _pages.length - 1
                      ? _completeOnboarding
                      : _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.chadGold,
                    foregroundColor: AppColors.textOnGold,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 8,
                    shadowColor: AppColors.chadGold.withValues(alpha: 0.3),
                  ),
                  child: Text(
                    _currentPage == _pages.length - 1 ? 'Chad 되기 시작!' : 'Next',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Chad 이미지
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.chadGold,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.chadGold.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Image.asset(
                page.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: page.backgroundColor,
                    child: Icon(
                      Icons.directions_run,
                      size: 80,
                      color: AppColors.chadGold,
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 48),

          // 제목
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.bebasNeue(
              fontSize: 32,
              color: AppColors.chadGold,
              height: 1.2,
              shadows: [
                Shadow(
                  color: AppColors.pureBlack,
                  blurRadius: 8,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 설명
          Text(
            page.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoCondensed(
              fontSize: 18,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);

    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String imagePath;
  final Color backgroundColor;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backgroundColor,
  });
}