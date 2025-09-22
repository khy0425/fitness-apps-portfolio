import 'package:flutter/material.dart';
import '../models/user_profile.dart';

/// Couch to 5K + Hal Higdon 기반 과학적 러닝 프로그레션
/// 참조: https://c25k.com/ + https://www.halhigdon.com/
class ScientificRunningData {

  /// 레벨별 설명 (훈련 경험 기반)
  static Map<UserLevel, String> get levelDescriptions => {
    UserLevel.rookie: '초보자 (러닝 경험 없음) - Couch to 5K',
    UserLevel.rising: '초급자 (3-6개월 러닝) - 5K 완주 목표',
    UserLevel.alpha: '중급자 (6-12개월 러닝) - 시간 단축',
    UserLevel.giga: '상급자 (1년+ 러닝) - 고급 훈련',
  };

  /// 과학적 러닝 프로그레션 (시간 기반 인터벌 훈련)
  /// C25K: 9주 프로그램을 6주로 압축 최적화
  /// Hal Higdon: 중급/고급 프로그램 적용
  static Map<UserLevel, Map<int, Map<int, RunningWorkout>>> get progressionPrograms => {

    // 초보자: Couch to 5K 기반 (걷기/뛰기 인터벌)
    UserLevel.rookie: {
      1: { // Week 1: 기본 인터벌 습득
        1: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3), // 5분 워킹
            RunningInterval(type: IntervalType.run, duration: 60, intensity: 0.6),     // 1분 러닝
            RunningInterval(type: IntervalType.walk, duration: 90, intensity: 0.3),    // 1.5분 워킹
            RunningInterval(type: IntervalType.run, duration: 60, intensity: 0.6),     // 반복 8회
            RunningInterval(type: IntervalType.walk, duration: 90, intensity: 0.3),
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2), // 5분 쿨다운
          ],
          totalDistance: 2.5,
          notes: '러닝 폼 익히기: 발 중간 착지, 자연스러운 팔 스윙',
        ),
        2: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 90, intensity: 0.6),     // 1.5분 러닝
            RunningInterval(type: IntervalType.walk, duration: 120, intensity: 0.3),   // 2분 워킹
            RunningInterval(type: IntervalType.run, duration: 90, intensity: 0.6),     // 반복 6회
            RunningInterval(type: IntervalType.walk, duration: 120, intensity: 0.3),
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 2.8,
          notes: '호흡 리듬 찾기: 3-2 패턴 (3보 들이마시기, 2보 내쉬기)',
        ),
        3: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 120, intensity: 0.6),    // 2분 러닝
            RunningInterval(type: IntervalType.walk, duration: 90, intensity: 0.3),    // 1.5분 워킹
            RunningInterval(type: IntervalType.run, duration: 120, intensity: 0.6),    // 반복 5회
            RunningInterval(type: IntervalType.walk, duration: 90, intensity: 0.3),
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 3.0,
          notes: '페이스 조절: 대화할 수 있는 속도 유지',
        ),
      },

      2: { // Week 2: 러닝 시간 증가
        1: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 180, intensity: 0.6),    // 3분 러닝
            RunningInterval(type: IntervalType.walk, duration: 120, intensity: 0.3),   // 2분 워킹
            RunningInterval(type: IntervalType.run, duration: 180, intensity: 0.6),    // 반복 4회
            RunningInterval(type: IntervalType.walk, duration: 120, intensity: 0.3),
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 3.2,
          notes: '러닝 경제성: 에너지 효율적인 움직임',
        ),
        2: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 300, intensity: 0.6),    // 5분 러닝
            RunningInterval(type: IntervalType.walk, duration: 180, intensity: 0.3),   // 3분 워킹
            RunningInterval(type: IntervalType.run, duration: 300, intensity: 0.6),    // 반복 2회
            RunningInterval(type: IntervalType.walk, duration: 180, intensity: 0.3),
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 3.5,
          notes: '지구력 기반: 천천히 하지만 꾸준히',
        ),
        3: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 480, intensity: 0.6),    // 8분 러닝
            RunningInterval(type: IntervalType.walk, duration: 300, intensity: 0.3),   // 5분 워킹
            RunningInterval(type: IntervalType.run, duration: 480, intensity: 0.6),    // 8분 러닝
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 4.0,
          notes: '정신력 훈련: 포기하고 싶을 때 극복하기',
        ),
      },

      3: { // Week 3-6: 지속적 러닝 능력 개발
        1: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 600, intensity: 0.6),    // 10분 연속
            RunningInterval(type: IntervalType.walk, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 600, intensity: 0.6),    // 10분 연속
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 4.2,
          notes: '연속 러닝: 10분 벽 돌파',
        ),
        2: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 900, intensity: 0.6),    // 15분 연속
            RunningInterval(type: IntervalType.walk, duration: 180, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 600, intensity: 0.6),    // 10분 연속
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 4.5,
          notes: '지구력 확장: 더 긴 구간 도전',
        ),
        3: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 1200, intensity: 0.6),   // 20분 연속
            RunningInterval(type: IntervalType.walk, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 300, intensity: 0.6),    // 5분 마무리
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 5.0,
          notes: '🎉 첫 5km 도전! 완주가 목표',
        ),
      },

      // Week 4-6은 연속 러닝 시간을 점진적으로 늘려 5K 완주 목표
      4: {
        1: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 1500, intensity: 0.6),   // 25분 연속
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 5.2,
          notes: '25분 연속 러닝 마스터',
        ),
        2: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 1680, intensity: 0.6),   // 28분 연속
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 5.5,
          notes: '30분 러닝 준비 단계',
        ),
        3: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 1800, intensity: 0.6),   // 30분 연속
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 6.0,
          notes: '30분 연속 러닝 달성!',
        ),
      },

      5: {
        1: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 1800, intensity: 0.65),  // 30분, 페이스 상승
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 6.2,
          notes: '페이스 향상: 조금 더 빠르게',
        ),
        2: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 1800, intensity: 0.65),
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 6.5,
          notes: '일정한 페이스 유지 연습',
        ),
        3: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 1800, intensity: 0.7),   // 더 빠른 페이스
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 7.0,
          notes: '5K 레이스 페이스 연습',
        ),
      },

      6: {
        1: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 1800, intensity: 0.7),
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 7.2,
          notes: '최종 테스트 준비',
        ),
        2: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 1500, intensity: 0.75),  // 25분 고강도
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 7.5,
          notes: '고강도 단거리 훈련',
        ),
        3: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 300, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 1800, intensity: 0.8),   // 레이스 시뮬레이션
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.2),
          ],
          totalDistance: 8.0,
          notes: '🏆 5K 레이스 완주! 축하합니다!',
        ),
      },
    },

    // 중급자: Hal Higdon 5K 중급 프로그램 적용
    UserLevel.rising: {
      1: {
        1: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 600, intensity: 0.4),
            RunningInterval(type: IntervalType.run, duration: 1800, intensity: 0.7),   // 30분 기본 러닝
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.3),
          ],
          totalDistance: 6.0,
          notes: '기본 지구력 확인 및 페이스 설정',
        ),
        2: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 600, intensity: 0.4),
            RunningInterval(type: IntervalType.run, duration: 300, intensity: 0.8),    // 5분 템포
            RunningInterval(type: IntervalType.walk, duration: 120, intensity: 0.3),
            RunningInterval(type: IntervalType.run, duration: 300, intensity: 0.8),    // 반복 4회
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.3),
          ],
          totalDistance: 5.5,
          notes: '템포 러닝: 10K 레이스 페이스',
        ),
        3: RunningWorkout(
          intervals: [
            RunningInterval(type: IntervalType.warmup, duration: 600, intensity: 0.4),
            RunningInterval(type: IntervalType.run, duration: 2400, intensity: 0.65),  // 40분 롱런
            RunningInterval(type: IntervalType.cooldown, duration: 300, intensity: 0.3),
          ],
          totalDistance: 8.0,
          notes: '롱런: 편안한 대화 페이스',
        ),
      },
      // ... 중급자 프로그램 계속
    },

    // 상급자, 전문가 레벨도 유사하게 구현
    UserLevel.alpha: {
      // Hal Higdon 5K 고급 프로그램
    },

    UserLevel.giga: {
      // 엘리트 러너 프로그램
    },
  };

  /// 레벨별 6주 목표
  static Map<UserLevel, Map<String, dynamic>> get sixWeekGoals => {
    UserLevel.rookie: {
      'distance': 5.0,
      'time': Duration(minutes: 30),
      'description': '5K 완주 (30분 이내)',
    },
    UserLevel.rising: {
      'distance': 5.0,
      'time': Duration(minutes: 25),
      'description': '5K 25분 돌파',
    },
    UserLevel.alpha: {
      'distance': 5.0,
      'time': Duration(minutes: 22),
      'description': '5K 22분 돌파',
    },
    UserLevel.giga: {
      'distance': 5.0,
      'time': Duration(minutes: 20),
      'description': '5K 20분 돌파',
    },
  };

  /// 과학적 근거 기반 훈련 원리
  static Map<String, String> get trainingPrinciples => {
    '점진적 과부하': '매주 10% 이내 증가로 부상 방지',
    '특이성 원리': '목표에 맞는 구체적 훈련',
    '회복의 중요성': '적응과 성장은 휴식 중에 발생',
    '개별성 원리': '개인의 체력과 경험에 맞춘 조절',
    '지속성 원리': '꾸준한 훈련이 핵심',
  };

  /// 주간 훈련 포커스
  static Map<int, String> get weeklyFocus => {
    1: '기본 인터벌 적응 (걷기/뛰기)',
    2: '러닝 시간 연장 (지구력)',
    3: '연속 러닝 개발 (정신력)',
    4: '페이스 안정화 (일관성)',
    5: '속도 향상 (파워)',
    6: '레이스 시뮬레이션 (완주)',
  };
}

/// 러닝 인터벌 타입
enum IntervalType {
  warmup,    // 워밍업
  run,       // 러닝
  walk,      // 걷기
  cooldown,  // 쿨다운
  tempo,     // 템포 러닝
  interval,  // 인터벌 러닝
}

/// 러닝 인터벌 클래스
class RunningInterval {
  final IntervalType type;
  final int duration;      // 초 단위
  final double intensity;  // 0.0-1.0 (최대 심박수 대비 %)

  const RunningInterval({
    required this.type,
    required this.duration,
    required this.intensity,
  });

  /// 예상 거리 (페이스 기반)
  double getDistance(double averagePace) {
    return (duration / 60) * averagePace; // km
  }

  /// 심박수 존 계산
  int getHeartRateZone() {
    if (intensity < 0.4) return 1;      // 지방 연소 존
    if (intensity < 0.6) return 2;      // 유산소 기본 존
    if (intensity < 0.7) return 3;      // 유산소 향상 존
    if (intensity < 0.8) return 4;      // 무산소 역치 존
    return 5;                           // 최대 파워 존
  }
}

/// 러닝 운동 세션 클래스
class RunningWorkout {
  final List<RunningInterval> intervals;
  final double totalDistance;  // km
  final String notes;

  const RunningWorkout({
    required this.intervals,
    required this.totalDistance,
    required this.notes,
  });

  /// 총 운동 시간
  Duration get totalDuration {
    int totalSeconds = intervals.fold(0, (sum, interval) => sum + interval.duration);
    return Duration(seconds: totalSeconds);
  }

  /// 순수 러닝 시간
  Duration get runningTime {
    int runningSeconds = intervals
        .where((interval) => interval.type == IntervalType.run || interval.type == IntervalType.tempo)
        .fold(0, (sum, interval) => sum + interval.duration);
    return Duration(seconds: runningSeconds);
  }

  /// 평균 페이스 (분/km)
  double get averagePace {
    if (totalDistance == 0) return 0;
    return totalDuration.inMinutes / totalDistance;
  }

  /// 운동 강도 (평균)
  double get averageIntensity {
    if (intervals.isEmpty) return 0;
    return intervals.fold(0.0, (sum, interval) => sum + interval.intensity) / intervals.length;
  }

  /// 칼로리 소모량 추정 (체중 70kg 기준)
  int get estimatedCalories {
    return (totalDistance * 70 * 1.036).round(); // METs 공식 기반
  }
}
