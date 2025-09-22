import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'utils/burpee_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const BurpeeApp());
}

class BurpeeApp extends StatelessWidget {
  const BurpeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burpee Beast',
      debugShowCheckedModeBanner: false,
      theme: BurpeeTheme.themeData,
      home: const BurpeeHomeScreen(),
    );
  }
}

class BurpeeHomeScreen extends StatefulWidget {
  const BurpeeHomeScreen({super.key});

  @override
  State<BurpeeHomeScreen> createState() => _BurpeeHomeScreenState();
}

class _BurpeeHomeScreenState extends State<BurpeeHomeScreen> {
  int currentWeek = 1;
  int currentDay = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🏋️‍♂️ Burpee Beast'),
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
                        color: BurpeeTheme.primaryColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '100개 버피을 향해!',
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
                        '오늘의 Burpee 프로그램',
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
