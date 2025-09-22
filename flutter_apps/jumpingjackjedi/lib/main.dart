import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'utils/jumping_jack_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const Jumping_JackApp());
}

class Jumping_JackApp extends StatelessWidget {
  const Jumping_JackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jumping Jack Jedi',
      debugShowCheckedModeBanner: false,
      theme: Jumping_JackTheme.themeData,
      home: const Jumping_JackHomeScreen(),
    );
  }
}

class Jumping_JackHomeScreen extends StatefulWidget {
  const Jumping_JackHomeScreen({super.key});

  @override
  State<Jumping_JackHomeScreen> createState() => _Jumping_JackHomeScreenState();
}

class _Jumping_JackHomeScreenState extends State<Jumping_JackHomeScreen> {
  int currentWeek = 1;
  int currentDay = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🏋️‍♂️ Jumping Jack Jedi'),
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
                        color: Jumping_JackTheme.primaryColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '500개 점핑잭을 향해!',
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
                        '오늘의 Jumping_Jack 프로그램',
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
