
import 'package:flutter/material.dart';
import '../utils/scientific_sit_data.dart';

class SITWorkoutScreen extends StatefulWidget {
  @override
  _SITWorkoutScreenState createState() => _SITWorkoutScreenState();
}

class _SITWorkoutScreenState extends State<SITWorkoutScreen> {
  String selectedLevel = 'rookie';
  int currentWeek = 1;
  int currentDay = 1;
  bool isRunning = false;
  int currentRound = 0;
  int timeRemaining = 0;
  bool isSprinting = true;

  @override
  Widget build(BuildContext context) {
    final todayWorkout = ScientificSITData.sitPrograms[selectedLevel]![currentWeek]![currentDay]!;

    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0A0E27), Color(0xFF1E3A5F)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                // 헤더
                Text(
                  '⚡ GIGACHAD SPRINT TRAINING',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  ScientificSITData.weeklyFocus[currentWeek]!,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),

                SizedBox(height: 30),

                // 오늘의 워크아웃
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.amber, width: 2),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'WEEK $currentWeek - DAY $currentDay',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatCard('SPRINT', '${todayWorkout['sprint']}초', Colors.red),
                          _buildStatCard('REST', '${todayWorkout['rest']}초', Colors.blue),
                          _buildStatCard('ROUNDS', '${todayWorkout['rounds']}', Colors.green),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Intensity: ${todayWorkout['intensity']}',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // 타이머 디스플레이
                if (isRunning) ...[
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSprinting ? Colors.red : Colors.blue,
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isSprinting ? '🔥 SPRINT!' : '💨 REST',
                            style: TextStyle(
                              color: isSprinting ? Colors.red : Colors.blue,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$timeRemaining',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Round $currentRound / ${todayWorkout['rounds']}',
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                Spacer(),

                // 시작 버튼
                ElevatedButton(
                  onPressed: isRunning ? null : _startWorkout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    isRunning ? 'RUNNING...' : 'START SPRINT',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // 과학적 혜택
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    ScientificSITData.scientificBenefits['fatLoss']!,
                    style: TextStyle(color: Colors.green, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  void _startWorkout() {
    setState(() {
      isRunning = true;
      currentRound = 1;
      isSprinting = true;
      // 타이머 로직 구현
    });
  }
}
