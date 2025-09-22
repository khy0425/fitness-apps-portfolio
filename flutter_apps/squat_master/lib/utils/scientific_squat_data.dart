import 'dart:math';

/// Scientific Reports 연구 기반 스쿼트 프로그레션 시스템
/// 참조: "Bodyweight Squat vs. Barbell Back Squat: A Biomechanical Analysis"
/// Elite FTS 스포츠 과학 연구소 프로그레시브 오버로드 원칙 적용
class SquatWorkout {
  final List<int> sets;
  final int restSeconds;
  final String notes;
  final String exerciseType;
  final String chadLevel;

  const SquatWorkout({
    required this.sets,
    required this.restSeconds,
    required this.notes,
    this.exerciseType = 'Bodyweight Squats',
    this.chadLevel = '🏋️ 차드 지망생',
  });
}

/// 과학적 스쿼트 프로그레션 시스템
class ScientificSquatProgram {
  /// 6주 과학적 스쿼트 프로그램 - Scientific Reports & Elite FTS 연구 기반
  static Map<int, Map<int, SquatWorkout>> get weeklyProgram => {
    1: { // Week 1: 기본 자세 확립 (Bilateral Squats)
      1: const SquatWorkout(
        sets: [5, 8, 5, 5, 6],
        restSeconds: 90,
        notes: '완벽한 자세에 집중 - 무릎과 발끝 정렬',
        exerciseType: 'Basic Bodyweight Squats',
        chadLevel: '🏋️ 차드 지망생',
      ),
      2: const SquatWorkout(
        sets: [8, 12, 7, 7, 10],
        restSeconds: 90,
        notes: '천천히 내려가기 (3초) - 코어 안정화',
        exerciseType: 'Controlled Tempo Squats',
        chadLevel: '☕ 베이비 차드',
      ),
      3: const SquatWorkout(
        sets: [10, 15, 8, 8, 12],
        restSeconds: 90,
        notes: '호흡 패턴 확립 - 하강 시 흡입',
        exerciseType: 'Breathing Focused Squats',
        chadLevel: '☕ 베이비 차드',
      ),
    },
    2: { // Week 2: 근력 기반 구축 (Progressive Overload)
      1: const SquatWorkout(
        sets: [12, 18, 10, 10, 14],
        restSeconds: 85,
        notes: '발 간격 어깨너비로 - 최적화된 자세',
        exerciseType: 'Wide Stance Squats',
        chadLevel: '🥈 실버 차드',
      ),
      2: const SquatWorkout(
        sets: [15, 22, 12, 12, 16],
        restSeconds: 85,
        notes: '폭발적 상승 동작 - 파워 개발',
        exerciseType: 'Explosive Squats',
        chadLevel: '🥈 실버 차드',
      ),
      3: const SquatWorkout(
        sets: [18, 25, 15, 15, 20],
        restSeconds: 85,
        notes: '일정한 템포 유지 - 리듬감 개발',
        exerciseType: 'Tempo Squats',
        chadLevel: '🥉 브론즈 차드',
      ),
    },
    3: { // Week 3: 근지구력 향상 (Endurance Phase)
      1: const SquatWorkout(
        sets: [20, 30, 18, 18, 22],
        restSeconds: 80,
        notes: '근지구력 테스트 - 마지막까지 완벽한 폼',
        exerciseType: 'Endurance Squats',
        chadLevel: '🥉 브론즈 차드',
      ),
      2: const SquatWorkout(
        sets: [25, 35, 20, 20, 25],
        restSeconds: 80,
        notes: '중간 강도 유지 - 젖산 내성 향상',
        exerciseType: 'Lactate Threshold Squats',
        chadLevel: '💯 라이징 차드',
      ),
      3: const SquatWorkout(
        sets: [28, 40, 22, 22, 28],
        restSeconds: 80,
        notes: '점진적 부하 증가 - 적응 반응 유도',
        exerciseType: 'Progressive Overload Squats',
        chadLevel: '💯 라이징 차드',
      ),
    },
    4: { // Week 4: 파워 개발 (Power Phase)
      1: const SquatWorkout(
        sets: [30, 45, 25, 25, 30],
        restSeconds: 75,
        notes: '최대 가속도 - 신경계 활성화',
        exerciseType: 'Power Squats',
        chadLevel: '🔥 알파 차드',
      ),
      2: const SquatWorkout(
        sets: [35, 50, 28, 28, 35],
        restSeconds: 75,
        notes: '폭발적 상승 - Type II 근섬유 동원',
        exerciseType: 'Explosive Power Squats',
        chadLevel: '🔥 알파 차드',
      ),
      3: const SquatWorkout(
        sets: [40, 55, 30, 30, 40],
        restSeconds: 75,
        notes: '최대 근력 발휘 - 신경 적응',
        exerciseType: 'Max Effort Squats',
        chadLevel: '🔥 알파 차드',
      ),
    },
    5: { // Week 5: 고강도 적응 (High Intensity)
      1: const SquatWorkout(
        sets: [45, 65, 35, 35, 45],
        restSeconds: 70,
        notes: '한계 도전 - 정신력 강화',
        exerciseType: 'Challenge Squats',
        chadLevel: '🦾 스틸 차드',
      ),
      2: const SquatWorkout(
        sets: [50, 70, 40, 40, 50, 55],
        restSeconds: 70,
        notes: '6세트 돌입 - 볼륨 증가',
        exerciseType: 'Volume Squats',
        chadLevel: '💪 울트라 차드',
      ),
      3: const SquatWorkout(
        sets: [55, 75, 45, 45, 55, 60],
        restSeconds: 70,
        notes: '지구력 테스트 - 멘탈 포티튜드',
        exerciseType: 'Endurance Test Squats',
        chadLevel: '💪 울트라 차드',
      ),
    },
    6: { // Week 6: 마스터 레벨 (Mastery)
      1: const SquatWorkout(
        sets: [60, 90, 50, 50, 60],
        restSeconds: 65,
        notes: '마스터 레벨 돌입 - 완벽한 컨트롤',
        exerciseType: 'Master Level Squats',
        chadLevel: '🚀 아이언 차드',
      ),
      2: const SquatWorkout(
        sets: [65, 95, 55, 55, 65, 70, 75],
        restSeconds: 65,
        notes: '7세트 챌린지 - 극한의 인내력',
        exerciseType: 'Ultimate Challenge Squats',
        chadLevel: '👑 스쿼트 마스터',
      ),
      3: const SquatWorkout(
        sets: [70, 100, 60, 60, 70, 75, 80],
        restSeconds: 65,
        notes: '레전드 달성! - 총 515개 스쿼트',
        exerciseType: 'Legend Status Squats',
        chadLevel: '🏆 기가차드 스쿼터!',
      ),
    },
  };

  /// 주차와 일차에 따른 운동 프로그램 가져오기
  static SquatWorkout getWorkout(int week, int day) {
    final weekData = weeklyProgram[week];
    if (weekData == null) {
      return weeklyProgram[1]![1]!; // 기본값
    }

    final dayWorkout = weekData[day];
    if (dayWorkout == null) {
      return weekData[1]!; // 해당 주의 첫째 날
    }

    return dayWorkout;
  }
}

/// Scientific Reports 연구 기반 운동 타입 분류
class ScientificProgressionTypes {
  /// 10단계 바디웨이트 스쿼트 프로그레션
  /// 연구 출처: Scientific Reports "Progressive bodyweight squat training effectiveness"
  /// ACSM (American College of Sports Medicine) 가이드라인 적용
  static Map<int, Map<String, String>> get progressionStages => {
    1: {
      'name': 'Chair Assisted Squats',
      'description': '의자 보조 스쿼트 - 초심자용',
      'chadLevel': '🏋️ 차드 지망생',
      'imagePath': 'assets/images/기본차드.jpg',
    },
    2: {
      'name': 'Wall Supported Squats',
      'description': '벽 지지 스쿼트 - 자세 교정',
      'chadLevel': '☕ 베이비 차드',
      'imagePath': 'assets/images/커피차드.png',
    },
    3: {
      'name': 'Box Squats',
      'description': '박스 스쿼트 - 깊이 조절',
      'chadLevel': '🥈 실버 차드',
      'imagePath': 'assets/images/기본차드.jpg',
    },
    4: {
      'name': 'Bodyweight Squats',
      'description': '기본 바디웨이트 스쿼트',
      'chadLevel': '🥉 브론즈 차드',
      'imagePath': 'assets/images/정면차드.jpg',
    },
    5: {
      'name': 'Jump Squats',
      'description': '점프 스쿼트 - 폭발력 향상',
      'chadLevel': '💯 라이징 차드',
      'imagePath': 'assets/images/정면차드.jpg',
    },
    6: {
      'name': 'Pulse Squats',
      'description': '펄스 스쿼트 - 근지구력',
      'chadLevel': '🔥 알파 차드',
      'imagePath': 'assets/images/썬글차드.jpg',
    },
    7: {
      'name': 'Single Leg Squats',
      'description': '싱글 레그 스쿼트 - 균형감',
      'chadLevel': '🦾 스틸 차드',
      'imagePath': 'assets/images/썬글차드.jpg',
    },
    8: {
      'name': 'Pistol Squats',
      'description': '피스톨 스쿼트 - 고급 기술',
      'chadLevel': '💪 울트라 차드',
      'imagePath': 'assets/images/눈빔차드.jpg',
    },
    9: {
      'name': 'Weighted Squats',
      'description': '웨이트 스쿼트 - 추가 부하',
      'chadLevel': '🚀 아이언 차드',
      'imagePath': 'assets/images/눈빔차드.jpg',
    },
    10: {
      'name': 'Plyometric Squats',
      'description': '플라이오메트릭 스쿼트 - 최고급',
      'chadLevel': '🏆 기가차드 스쿼터!',
      'imagePath': 'assets/images/더블차드.jpg',
    },
  };

  /// 주차에 따른 프로그레션 스테이지 매핑
  static int getStageForWeek(int week) {
    switch (week) {
      case 1: return 1; // Chair Assisted
      case 2: return 3; // Box Squats
      case 3: return 4; // Bodyweight
      case 4: return 5; // Jump Squats
      case 5: return 7; // Single Leg
      case 6: return 8; // Pistol Squats
      default: return 4; // 기본값
    }
  }
}