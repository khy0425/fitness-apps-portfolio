import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'utils/lunge_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const LungeApp());
}

class LungeApp extends StatelessWidget {
  const LungeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lunge Legend',
      debugShowCheckedModeBanner: false,
      theme: LungeTheme.themeData,
      home: const LungeHomeScreen(),
    );
  }
}

class LungeHomeScreen extends StatefulWidget {
  const LungeHomeScreen({super.key});

  @override
  State<LungeHomeScreen> createState() => _LungeHomeScreenState();
}

class _LungeHomeScreenState extends State<LungeHomeScreen> {
  int currentWeek = 1;
  int currentDay = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🏋️‍♂️ Lunge Legend'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Week $currentWeek - Day $currentDay',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: LungeTheme.primaryColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '150개 런지을 향해!',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        '오늘의 Lunge 프로그램',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Center(
                          child: Text(
                            '준비 중...',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // TODO: 운동 시작 로직
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              ),
              child: Text(
                '🔥 운동 시작하기',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
