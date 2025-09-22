import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'utils/scientific_squat_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const SquatMasterApp());
}

class SquatMasterApp extends StatelessWidget {
  const SquatMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Squat Master - 6주 스쿼트 챌린지',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        primaryColor: const Color(0xFFFFD700), // 골드 옐로우
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2A2A2A),
          foregroundColor: Color(0xFFFFD700),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD700),
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const SquatHomeScreen(),
    );
  }
}

class SquatHomeScreen extends StatefulWidget {
  const SquatHomeScreen({super.key});

  @override
  State<SquatHomeScreen> createState() => _SquatHomeScreenState();
}

class _SquatHomeScreenState extends State<SquatHomeScreen> {
  int currentWeek = 1;
  int currentDay = 1;

  SquatWorkout getCurrentWorkout() {
    return ScientificSquatProgram.getWorkout(currentWeek, currentDay);
  }

  int getTotalReps() {
    return getCurrentWorkout().sets.fold(0, (sum, reps) => sum + reps);
  }

  // 현재 운동 타입 및 차드 레벨 가져오기
  String getCurrentExerciseType() {
    return getCurrentWorkout().exerciseType;
  }

  String getCurrentChadLevel() {
    return getCurrentWorkout().chadLevel;
  }

  String getCurrentNotes() {
    return getCurrentWorkout().notes;
  }

  // 과학적 차드 레벨에 따른 이미지 선택
  String getChadImageForProgress() {
    String chadLevel = getCurrentChadLevel();

    if (chadLevel.contains('스쿼트 마스터') || chadLevel.contains('레전드')) {
      return 'assets/images/더블차드.jpg';
    } else if (chadLevel.contains('울트라') || chadLevel.contains('아이언')) {
      return 'assets/images/눈빔차드.jpg';
    } else if (chadLevel.contains('알파') || chadLevel.contains('스틸')) {
      return 'assets/images/썬글차드.jpg';
    } else if (chadLevel.contains('라이징') || chadLevel.contains('브론즈')) {
      return 'assets/images/정면차드.jpg';
    } else if (chadLevel.contains('베이비') || chadLevel.contains('실버')) {
      return 'assets/images/커피차드.png';
    } else {
      return 'assets/images/기본차드.jpg';
    }
  }

  // 과학적 차드 레벨 타이틀
  String getChadTitleForProgress() {
    return getCurrentChadLevel();
  }

  // 과학적 차드 메시지
  String getChadMessageForProgress() {
    String notes = getCurrentNotes();
    List<String> motivationalMessages = [
      '과학적 스쿼트로 차드 DNA 각성! 💪',
      '2023년 연구 기반 트레이닝! 🧬',
      '진정한 차드는 과학을 믿는다! 🔬',
      '체계적 발전으로 기가차드 되기! ⚡',
      '연구 검증된 방법으로 성장! 📊',
    ];
    return notes.isNotEmpty ? notes : motivationalMessages[currentWeek % motivationalMessages.length];
  }

  @override
  Widget build(BuildContext context) {
    final workout = getCurrentWorkout();
    final totalReps = getTotalReps();
    final exerciseType = getCurrentExerciseType();

    return Scaffold(
      appBar: AppBar(
        title: const Text('🏋️‍♀️ Squat Master'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 기가차드 이미지 표시
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFD700), Color(0xFFFF8C00)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          getChadImageForProgress(),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[800],
                              child: const Icon(
                                Icons.fitness_center,
                                size: 40,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            getChadTitleForProgress(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            getChadMessageForProgress(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 주차 및 일차 표시
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      '주차 $currentWeek - 일차 $currentDay',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFD700),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$exerciseType',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFF8C00),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '총 $totalReps개',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 운동 세트 표시
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '오늘의 $exerciseType:',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        getCurrentNotes(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFFFFD700),
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      Expanded(
                        child: ListView.builder(
                          itemCount: workout.sets.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFF3A3A3A),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xFFFFD700),
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '세트 ${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '${workout.sets[index]}개',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFFD700),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 컨트롤 버튼들
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: currentDay > 1 ? () {
                      setState(() {
                        if (currentDay > 1) {
                          currentDay--;
                        } else if (currentWeek > 1) {
                          currentWeek--;
                          currentDay = 3;
                        }
                      });
                    } : null,
                    child: const Text('◀ 이전'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutScreen(
                            week: currentWeek,
                            day: currentDay,
                            workout: workout.sets,
                            exerciseType: exerciseType,
                            restSeconds: workout.restSeconds,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B00),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      '🔥 시작하기',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (currentWeek < 6 || currentDay < 3) ? () {
                      setState(() {
                        if (currentDay < 3) {
                          currentDay++;
                        } else if (currentWeek < 6) {
                          currentWeek++;
                          currentDay = 1;
                        }
                      });
                    } : null,
                    child: const Text('다음 ▶'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 진행 상황
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      '6주 챌린지 진행상황',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: ((currentWeek - 1) * 3 + currentDay) / 18,
                      backgroundColor: Colors.grey[700],
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD700)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${((currentWeek - 1) * 3 + currentDay)} / 18 일 완료',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutScreen extends StatefulWidget {
  final int week;
  final int day;
  final List<int> workout;
  final String exerciseType;
  final int restSeconds;

  const WorkoutScreen({
    super.key,
    required this.week,
    required this.day,
    required this.workout,
    required this.exerciseType,
    required this.restSeconds,
  });

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int currentSet = 0;
  bool isResting = false;
  late int restTime;

  @override
  void initState() {
    super.initState();
    restTime = widget.restSeconds;
  }

  // 동기부여 차드 이미지 (운동 중에는 더 강렬한 이미지들)
  String getMotivationalChadImage() {
    List<String> motivationalImages = [
      'assets/images/정면차드.jpg',
      'assets/images/썬글차드.jpg',
      'assets/images/눈빔차드.jpg',
      'assets/images/더블차드.jpg',
    ];
    return motivationalImages[currentSet % motivationalImages.length];
  }

  // 과학적 동기부여 메시지
  String getMotivationalMessage() {
    List<String> messages = [
      '💪 과학적 차드 트레이닝 진행 중!',
      '🔥 Scientific Reports 연구 기반 운동법!',
      '⚡ 체계적 발전으로 기가차드 되기!',
      '🏆 Elite FTS 검증된 방법으로 성장!',
      '💯 차드 DNA 과학적 각성!',
      '🧠 ACSM 프로그레시브 오버로드 적용!',
      '📊 데이터 기반 차드 진화!',
    ];
    return messages[currentSet % messages.length];
  }

  // 운동 완료 메시지
  String getChadCompletionMessage() {
    List<String> completionMessages = [
      '기가차드 파워 충전 완료! 💪',
      '오늘도 차드의 길을 걸었다! 🔥',
      '차드 레벨업! 더 강해졌어! ⚡',
      '진정한 차드는 이런 거야! 🏆',
      '넌 이미 기가차드다! 🌟',
      '차드의 DNA가 각성됐다! 💯',
    ];
    return completionMessages[(widget.week + widget.day + currentSet) % completionMessages.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('${widget.week}주차 ${widget.day}일차'),
            Text(
              widget.exerciseType,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFFFD700),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (currentSet < widget.workout.length) ...[
              // 동기부여 차드 이미지
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: const Color(0xFFFFD700), width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFD700).withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    getMotivationalChadImage(),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFD700),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.fitness_center,
                          size: 40,
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              ),

              Text(
                getMotivationalMessage(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD700),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              Text(
                '세트 ${currentSet + 1}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                '${widget.workout[currentSet]}',
                style: const TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD700),
                ),
              ),
              Text(
                widget.exerciseType.contains('Squats') ? '개 스쿼트' : '개 ${widget.exerciseType}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (currentSet < widget.workout.length - 1) {
                      currentSet++;
                      isResting = true;
                      restTime = widget.restSeconds; // 과학적 휴식 시간 적용
                    } else {
                      // 운동 완료 - 차드 스타일 메시지
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('🏆 ${getChadCompletionMessage()}'),
                          backgroundColor: const Color(0xFFFFD700),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  backgroundColor: const Color(0xFF4CAF50),
                ),
                child: Text(
                  currentSet < widget.workout.length - 1 ? '완료 ✅' : '마지막 세트 완료! 🎉',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],

            if (isResting && currentSet < widget.workout.length) ...[
              const SizedBox(height: 40),
              const Text(
                '휴식 시간',
                style: TextStyle(fontSize: 20, color: Color(0xFFFF9800)),
              ),
              Text(
                '$restTime초',
                style: const TextStyle(fontSize: 48, color: Color(0xFFFF9800)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isResting = false;
                  });
                },
                child: const Text('휴식 완료'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
