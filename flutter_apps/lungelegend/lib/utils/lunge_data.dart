import 'package:flutter/material.dart';
import '../models/user_profile.dart';

/// Lunge Legend 전용 운동 프로그레션 데이터
/// 과학적 근거: lower_body_strength_research
class LungeData {

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
        1: [4, 6, 4, 4, 4],
        2: [6, 9, 5, 5, 8],
        3: [8, 12, 6, 6, 9],
      },
      2: {
        1: [9, 14, 8, 8, 11],
        2: [12, 17, 9, 9, 12],
        3: [14, 20, 12, 12, 16],
      },
      3: {
        1: [16, 24, 14, 14, 17],
        2: [20, 28, 16, 16, 20],
        3: [22, 32, 17, 17, 22],
      },
      4: {
        1: [24, 36, 20, 20, 24],
        2: [28, 40, 22, 22, 28],
        3: [32, 44, 24, 24, 32],
      },
      5: {
        1: [36, 52, 28, 28, 36],
        2: [40, 56, 32, 32, 40],
        3: [44, 60, 36, 36, 44],
      },
      6: {
        1: [48, 72, 40, 40, 48],
        2: [52, 76, 44, 44, 52],
        3: [56, 80, 48, 48, 56],
      },
    },
  };

  /// 레벨별 목표
  static Map<UserLevel, String> get goals => {
    UserLevel.rookie: '150개 런지 (초보자)',
    UserLevel.rising: '150개 런지 (중급자)',
    UserLevel.alpha: '150개 런지 (상급자)',
    UserLevel.giga: '150개 런지 (전문가)',
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
