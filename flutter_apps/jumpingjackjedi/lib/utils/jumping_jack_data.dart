import 'package:flutter/material.dart';
import '../models/user_profile.dart';

/// Jumping Jack Jedi 전용 운동 프로그레션 데이터
/// 과학적 근거: cardio_fitness_research
class Jumping_JackData {

  /// 레벨별 설명
  static Map<UserLevel, String> get levelDescriptions => {
    UserLevel.rookie: '초보자 - 기본기 습득',
    UserLevel.rising: '중급자 - 실력 향상',
    UserLevel.alpha: '상급자 - 고급 기술',
    UserLevel.giga: '전문가 - 마스터 레벨',
  };

  /// 6주 프로그레션 프로그램
  static Map<UserLevel, Map<int, Map<int, List<int>>>> get progressionPrograms => {
    UserLevel.rookie: {
      1: {
        1: [10, 16, 10, 10, 12],
        2: [16, 24, 14, 14, 20],
        3: [20, 30, 16, 16, 24],
      },
      2: {
        1: [24, 36, 20, 20, 28],
        2: [30, 44, 24, 24, 32],
        3: [36, 50, 30, 30, 40],
      },
      3: {
        1: [40, 60, 36, 36, 44],
        2: [50, 70, 40, 40, 50],
        3: [56, 80, 44, 44, 56],
      },
      4: {
        1: [60, 90, 50, 50, 60],
        2: [70, 100, 56, 56, 70],
        3: [80, 110, 60, 60, 80],
      },
      5: {
        1: [90, 130, 70, 70, 90],
        2: [100, 140, 80, 80, 100],
        3: [110, 150, 90, 90, 110],
      },
      6: {
        1: [120, 180, 100, 100, 120],
        2: [130, 190, 110, 110, 130],
        3: [140, 200, 120, 120, 140],
      },
    },
  };

  /// 레벨별 목표
  static Map<UserLevel, String> get goals => {
    UserLevel.rookie: '500개 점핑잭 (초보자)',
    UserLevel.rising: '500개 점핑잭 (중급자)',
    UserLevel.alpha: '500개 점핑잭 (상급자)',
    UserLevel.giga: '500개 점핑잭 (전문가)',
  };

  /// 휴식 시간 (초)
  static Map<UserLevel, int> get restTimeSeconds => {
    UserLevel.rookie: 90,
    UserLevel.rising: 75,
    UserLevel.alpha: 60,
    UserLevel.giga: 45,
  };

  /// 주간 포커스
  static Map<int, String> get weeklyFocus => {
    1: '기본기 다지기',
    2: '자세 안정화',
    3: '볼륨 증가',
    4: '강도 상승',
    5: '고강도 적응',
    6: '최대 성능',
  };
}
