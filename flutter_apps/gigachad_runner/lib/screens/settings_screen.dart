import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';
import '../providers/workout_provider.dart';
import '../services/ad_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _runReminders = true;
  bool _activayUpdates = true;
  bool _promotionalOffers = true;
  bool _darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '설정',
          style: GoogleFonts.bebasNeue(
            fontSize: 28,
            color: const Color(0xFFFFD700),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 사용자 프로필
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFFFD700), width: 2),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFFFFD700),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'GigaChad Runner',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 24,
                      color: const Color(0xFFFFD700),
                    ),
                  ),
                  Text(
                    'User Name',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Chad Boost 섹션
            Consumer<WorkoutProvider>(
              builder: (context, workoutProvider, child) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: workoutProvider.isChadBoostActive
                          ? const Color(0xFFFF6B6B)
                          : const Color(0xFFFFD700),
                      width: 2
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.flash_on,
                            color: workoutProvider.isChadBoostActive
                                ? const Color(0xFFFF6B6B)
                                : const Color(0xFFFFD700),
                            size: 28,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chad Level Boost',
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 20,
                                    color: const Color(0xFFFFD700),
                                  ),
                                ),
                                Text(
                                  workoutProvider.isChadBoostActive
                                      ? '부스트 활성화됨! 남은 시간: ${workoutProvider.chadBoostTimeRemaining}'
                                      : '30분간 Chad 레벨 1단계 상승',
                                  style: GoogleFonts.robotoCondensed(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: workoutProvider.isChadBoostActive
                              ? null
                              : () => _showChadBoostAd(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: workoutProvider.isChadBoostActive
                                ? Colors.grey
                                : const Color(0xFFFFD700),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            workoutProvider.isChadBoostActive
                                ? '부스트 활성화됨'
                                : '광고 보고 Chad Boost 받기',
                            style: GoogleFonts.robotoCondensed(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // 설정 섹션
            Text(
              'User Profile:',
              style: GoogleFonts.robotoCondensed(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // 알림 설정
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notifications:',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Clickount Settings',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  _buildSettingRow(
                    'Run Reminders',
                    _runReminders,
                    (value) => setState(() => _runReminders = value),
                  ),

                  _buildSettingRow(
                    'Activay Updates',
                    _activayUpdates,
                    (value) => setState(() => _activayUpdates = value),
                  ),

                  _buildSettingRow(
                    'Promotional Offers',
                    _promotionalOffers,
                    (value) => setState(() => _promotionalOffers = value),
                  ),

                  const SizedBox(height: 10),

                  // 튜토리얼 다시 보기 버튼
                  TextButton.icon(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('onboarding_completed', false);
                      if (context.mounted) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/onboarding',
                          (route) => false,
                        );
                      }
                    },
                    icon: Icon(Icons.help_outline, color: AppColors.chadGold),
                    label: Text(
                      '튜토리얼 다시 보기',
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 14,
                        color: AppColors.chadGold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'About:',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 테마 설정
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Theme',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  _buildSettingRow(
                    'Dark/Light Theme',
                    _darkMode,
                    (value) => setState(() => _darkMode = value),
                  ),

                  Row(
                    children: [
                      Text(
                        'Dark/Light',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // 마지막 여백 추가
          ],
        ),
      ),
    );
  }

  void _showChadBoostAd(BuildContext context) {
    // 리워드 광고 로드 확인
    AdService().loadRewardedAd();

    // 광고 표시
    AdService().showRewardedAd((amount, type) {
        // 광고 시청 완료시 Chad Boost 활성화
        final workoutProvider = Provider.of<WorkoutProvider>(context, listen: false);
        workoutProvider.activateChadBoost(minutes: 30);

        // 성공 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '🚀 Chad Level Boost 활성화! 30분간 레벨이 상승합니다!',
              style: GoogleFonts.robotoCondensed(fontSize: 16),
            ),
            backgroundColor: const Color(0xFFFFD700),
            duration: const Duration(seconds: 3),
          ),
        );
      },
    );
  }

  Widget _buildSettingRow(String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.robotoCondensed(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.red,
            activeTrackColor: Colors.red.withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }
}
